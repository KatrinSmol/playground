class Student < ApplicationRecord
  has_many :selfies
  has_many :memberships
  has_many :groups, through: :memberships
  belongs_to :user, optional: true
end
