class NotificationMailer < ApplicationMailer
  def send_notification_emails
    # アラーム機能がonになっている各スケジュールの開始時刻を取得する処理
    scheduled_jobs = Schedule.where(alarm: true)
    scheduled_jobs.each do |job|
      if job.start_time == Time.current # - 15.minutesは今は省略する
        send_notification_email(job.user, job).deliver_now
      end
    end
  end

  def send_notification_email(user, schedule)
    @schedule = schedule
    mail(
      to: user.email,
      subject: 'スケジュールの通知',
      from: ENV['SMTP_USERNAME'])
  end
end
