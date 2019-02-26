# == Schema Information
#
# Table name: time_tables
#
#  id         :integer          not null, primary key
#  day        :integer
#  start_time :integer
#  end_time   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# Time table
FactoryBot.define do
  factory :time_table do
    day { Faker::Number.positive(from = 1.00, to = 7.00) }
    start_time { 180 }
    end_time { 600 }
  end
end
