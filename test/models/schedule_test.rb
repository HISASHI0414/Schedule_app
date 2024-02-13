# == Schema Information
#
# Table name: schedules
#
#  id                :bigint           not null, primary key
#  alarm             :boolean          default(FALSE), not null
#  finished_at       :date             not null
#  schedule_repeated :boolean          default(FALSE), not null
#  started_at        :date             not null
#  title             :string           not null
#  url               :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :bigint           not null
#
# Indexes
#
#  index_schedules_on_user_id  (user_id)
#
require "test_helper"

class ScheduleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
