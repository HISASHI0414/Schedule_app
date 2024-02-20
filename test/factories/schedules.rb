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
FactoryBot.define do
  factory :schedule do
    title { "MyString" }
    started_at { "2024-02-13" }
    finished_at { "2024-02-13" }
    alarm { false }
    url { "MyText" }
  end
end
