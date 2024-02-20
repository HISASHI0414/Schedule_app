module RecurringSchedulesCreation
  extend ActiveSupport::Concern
  include ApplicationHelper

  # related_schedule_ids(スケジュールの繰り返しパターン）に応じて繰り返し処理により必要なデータを作成する
  # 作成したデータをdata_registering格納する。（データの一括登録はコントローラ側で行う）
  # Creates recurring schedules based on the given schedule parameters.
  #
  # @param schedule_params [Hash] The parameters for creating the schedules.
  # @return [void]
  def create_recurring_schedules(schedule_params)
    start_time = parse_date_select_params(schedule_params, "start_time")
    end_time = parse_date_select_params(schedule_params, "end_time")
    time_registering = start_time

    #related_schedules_idsが、既存スケジュールのrelated_schedules_idsと重複させないやり方がわからない。
    #やり方がわかれば、ここはそれに変更した方がいい。
    #繰り返しスケジュールでは共通したrelated_schedules_idsを持つことで、後で複数のスケジュールを一括で編集・削除できるようにする。
    related_schedules_ids = SecureRandom.uuid

    # まずは、schedules_controllerから渡されたデータをdata_registeringに格納。
    # その後、while処理でcaseごとに加算された日数がtime_registeringに入る。
    # 後でinsert_allを使用するため、created_atとupdated_atは明示的に記入する
    data_registering = []
    while time_registering <= end_time
      data = current_user.schedules.build(
        id: SecureRandom.uuid, #idがなぜかnilになるため、SecureRandom.uuidを使用
        title: schedule_params[:title],
        start_time: time_registering,
        end_time: time_registering,
        alarm: schedule_params[:alarm],
        related_schedules_ids: related_schedules_ids,
        created_at: Time.current,
        updated_at: Time.current)
      data_registering << data.attributes

      case schedule_params[:related_schedule_pattern]
      when "1" # 毎日
        time_registering += 1.day
      when "2" # 毎週
        time_registering += 1.week
      when "3" # 隔週
        time_registering += 2.week
      when "4" # 毎月
        time_registering += 1.month
      when "5" # 隔月
        time_registering += 2.month
      when "6" # 毎年
        time_registering += 1.year
      else
        break
      end
    end

    if Schedule.insert_all(data_registering)
      ScheduleMailer.creation_schedule_email(data).deliver_now
      redirect_to root_path, notice: "新規スケジュールを更新しました。"
    else
      render :edit, notice: "スケジュールの更新に失敗しました。", status: :unprocessable_entity
    end
  end
end
