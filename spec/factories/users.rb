# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  telephone       :string
#  nickname        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#

# User
FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    telephone { Faker::PhoneNumber.phone_number }
    nickname { Faker::Lorem.word }
    password_digest { Faker::DragonBall }
  end
end
