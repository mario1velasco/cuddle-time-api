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

require 'rails_helper'

RSpec.describe Assignment, type: :model do
  # Association test
  # ensure Todo model has a 1:m relationship with the Item model
  it { should belong_to(:time_table) }
  it { should belong_to(:user) }
  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:time_table_id) }
end
