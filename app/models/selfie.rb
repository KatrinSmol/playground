class Selfie < ApplicationRecord
  mount_uploader :image, SelfieUploader
  belongs_to :student
end
