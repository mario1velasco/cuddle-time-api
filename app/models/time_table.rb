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
  has_many :assignments, inverse_of: :time_table, dependent: :destroy, validate: true
  has_many :users, through: :assignments

  # Attributes
  accepts_nested_attributes_for :assignments, allow_destroy: true

  #Validators
  validates_presence_of :day, :start_time, :end_time
  validates_inclusion_of :day, in: 1..7
  validates_inclusion_of :start_time, in: 1..1440
  validates_inclusion_of :end_time, in: 1..1440
  validate :valid_date_range_required

  def valid_date_range_required
    errors.add(:end_time, 'must be later than start_time') if (start_time && end_time) && (end_time < start_time)
  end
end
