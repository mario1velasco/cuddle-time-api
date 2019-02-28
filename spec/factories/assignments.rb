# == Schema Information
#
# Table name: assignments
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  time_table_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

FactoryBot.define do
  factory :assignment do
    user_id       { nil }
    time_table_id { nil }
  end
end
