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
class Schedule < ApplicationRecord
  belongs_to :user, foreign_key: "user_id"
end
