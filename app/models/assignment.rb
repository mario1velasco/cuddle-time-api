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

class Assignment < ApplicationRecord
  # Relations
  belongs_to :time_table, inverse_of: :assignments
  belongs_to :user, inverse_of: :assignments

  # Attributes

  # Validations
  validates_presence_of :user_id
  # validates :client_id, presence: true, uniqueness: { scope: :user_id }
end
