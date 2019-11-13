class Group < ApplicationRecord
  has_many :memberships
  has_many :students, through: :memberships
  mount_uploader :cover, GroupCoverUploader
end
