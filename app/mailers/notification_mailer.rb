class NotificationMailer < ApplicationMailer
  def send_notification_emails
    # アラーム機能がonになっているかつ、開始時刻が一定の時間枠内にあるスケジュールを取得する処理
    schedules = Schedule.where(alarm: true)
                        .where(start_time: (Time.current - 1.day)..(Time.current + 1.day))
    schedules.each do |schedule|
      @schedule = schedule
      attachments['Haru.png'] = File.read('app/assets/images/Haru.png')
      attachments.inline['Kai.png'] = File.read('app/assets/images/Kai.png')
      mail(
      to: @schedule.user.email,
      subject: 'スケジュールの通知',
      from: ENV['SMTP_USERNAME'])
    end
  end
end
