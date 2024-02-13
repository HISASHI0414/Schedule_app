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
