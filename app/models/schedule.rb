# == Schema Information
#
# Table name: schedules
#
#  id                    :bigint           not null, primary key
#  alarm                 :boolean          default(FALSE), not null
#  end_time              :date
#  related_schedules_ids :integer
#  start_time            :date             not null
#  title                 :string           not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  user_id               :bigint           not null
#
# Indexes
#
#  index_schedules_on_user_id  (user_id)
#

class Schedule < ApplicationRecord
  belongs_to :user, foreign_key: "user_id"
  validates :title, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true

  validate :end_time_is_not_before_start_time

  def end_time_is_not_before_start_time
    if self.start_time > self.end_time
      errors.add(:end_time, "は開始日より前の日付で登録できません。")
    end
  end
end
