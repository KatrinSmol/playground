class Student < ApplicationRecord
  has_many :selfies
  belongs_to :user
end
