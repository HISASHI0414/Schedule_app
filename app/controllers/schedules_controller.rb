class SchedulesController < ApplicationController
  before_action :set_schedule, only: %w[show edit update destroy]

  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = current_user.schedules.build
  end

  def create
    @schedule = current_user.schedules.build(schedule_params)
    if @schedule.save
      # ScheduleMailer.creation_schedule_email(@schedule).deliver_now
      redirect_to root_path, notice: "新規スケジュールを登録しました。"
    else
      render :new, notice: "スケジュールの作成に失敗しました。", status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @schedule.update(schedule_params)
      # ScheduleMailer.creation_schedule_email(@schedule).deliver_now
      redirect_to root_path, notice: "新規スケジュールを更新しました。"
    else
      render :edit, notice: "スケジュールの更新に失敗しました。", status: :unprocessable_entity
    end
  end

  def destroy
    @schedule.destroy!
    redirect_to root_path
  end

  private
  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  def schedule_params
    params.require(:schedule).permit(
      :title, :start_time, :end_time, :alarm, :url, :schedule_repeated)
  end
end
