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

require 'rails_helper'

RSpec.describe User, type: :model do
  # Association test
  it { should have_many(:assignments).dependent(:destroy) }
  it { should have_many(:time_tables) }
  # Validation tests
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:telephone) }
  it { should validate_presence_of(:nickname) }
end
