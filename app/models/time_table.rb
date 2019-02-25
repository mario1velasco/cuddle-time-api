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

class TimeTable < ApplicationRecord
  # Relations
  has_many :assignments, inverse_of: :user, dependent: :destroy, validate: true
  has_many :users, through: :assignments

  #Validators
  validates_presence_of :day, :start_time, :end_time
end
