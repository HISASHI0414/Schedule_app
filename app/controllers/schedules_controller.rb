class SchedulesController < ApplicationController
  before_action :set_schedule, only: %w[show edit update destroy]
  include RecurringSchedulesCreation

  def index
    @schedules = Schedule.all
    weather_service = WeatherService.new(ENV["OPENWEATHERMAP_API_KEY"]) #seriveces/weather_service.rbに記載
    @forecasts = weather_service.forecast("Kawasaki")
  end

  def new
    @schedule = current_user.schedules.build
  end

  # def create
  #   @schedule = current_user.schedules.build(schedule_params)
  #   if @schedule.save
  #     ScheduleMailer.creation_schedule_email(@schedule).deliver_now
  #     redirect_to root_path, notice: "新規スケジュールを登録しました。"
  #   else
  #     render :new, notice: "スケジュールの作成に失敗しました。", status: :unprocessable_entity
  #   end
  # end

  def create
    # フォームから送信されたデータを処理
    create_recurring_schedules(schedule_params)
  end

  def show
  end

  def edit
  end

  def update
    if params[:schedule][:title].present?
      new_title = params[:schedule][:title]
      if Schedule.where(related_schedules_ids: @schedule.related_schedules_ids)
                  .update_all(title: new_title)
        ScheduleMailer.creation_schedule_email(@schedule).deliver_now
        redirect_to root_path, notice: "スケジュールを更新しました。"
      else
        render :edit, notice: "スケジュールの更新に失敗しました。", status: :unprocessable_entity
      end
    else
      render :edit, alert: 'タイトルは空にできません。', status: :unprocessable_entity
    end
  end

  def destroy
    Schedule.where(related_schedules_ids: @schedule.related_schedules_ids)
            .destroy_all
    ScheduleMailer.creation_schedule_email(@schedule).deliver_now
    redirect_to root_path
  end

  private
  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  def schedule_params
    params.require(:schedule).permit(
      :title, :start_time, :end_time, :alarm, :related_schedules_ids, :related_schedule_pattern)
  end
end
