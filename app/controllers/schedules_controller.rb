class SchedulesController < ApplicationController
  def index
  end

  def new
    @schedule = current_user.schedules
  end

  def create
    @schedule = current_user.schedules(schedule_params)
    if @schedule.save
      ScheduleMailer.creation_schedule_email(@schedule).deliver_now
      redirect_to root_path, notice: "新規スケジュールを登録しました。"
    else
      render :new, notice: "スケジュールの作成に失敗しました。"
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def schedule_params
    params.require(:schedule).permit(params[:title, :started_at, :finished_at, :alarm, :url, :schedule_repeated])
  end
end
