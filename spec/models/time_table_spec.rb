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

require 'rails_helper'

RSpec.describe TimeTable, type: :model do
  # Association test
  # ensure Todo model has a 1:m relationship with the Item model
  it { should have_many(:assignments).dependent(:destroy) }
  it { should have_many(:users) }
  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:day) }
  it { should validate_presence_of(:start_time) }
  it { should validate_presence_of(:end_time) }
end
