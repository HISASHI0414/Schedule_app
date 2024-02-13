class ScheduleMailer < ApplicationMailer
  def creation_schedule_email(schedule)
    @schedule = schedule
    mail(
      to: @schedule.user.email,
      subject: '新しいスケジュールが登録されました。',
      from: @schedule.user.email)
  end
end
