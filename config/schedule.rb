# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

set :environment, :development
set :output, "log/cron.log" # Set the output file to log/cron.log
set :runner_command, "rails runner"

env :PATH, ENV['RBENV_ROOT'] ? "#{ENV['RBENV_ROOT']}/shims:#{ENV['PATH']}" : ENV['PATH']
# every 1.minute do
#   command %Q{cd /Users/hisashi-fujisato/Schedule_app && bundle exec rails runner -e development "NotificationMailer.send_notification_emails.deliver_now; puts 'Email sent at #{Time.now}'"}
# end

every 1.hour do
  command %Q{cd /Users/hisashi-fujisato/Schedule_app && bundle exec rails runner -e development "NotificationMailer.send_notification_emails.deliver_now; puts 'Email sent at ' + Time.now.to_s"}
end
