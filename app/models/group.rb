class Group < ApplicationRecord
  mount_uploader :cover, GroupCoverUploader
end
