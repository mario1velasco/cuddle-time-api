# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  telephone  :string
#  nickname   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  # Relations
  has_many :assignments, inverse_of: :user, dependent: :destroy, validate: true
  has_many :time_tables, through: :assignments

  # accepts_nested_attributes_for :assignments, reject_if: :all_blank, allow_destroy: true

  # Validations
  validates_presence_of :name, :email, :telephone, :nickname
  # validates_associated :assignments
  # validates :assignments, :nested_attributes_uniqueness => {:field => :client_id}
end
