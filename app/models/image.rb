class Image < ActiveRecord::Base

  belongs_to :imageable, polymorphic: true
  mount_uploader :avatar, AvatarUploader
  attr_accessible :avatar, :description

end