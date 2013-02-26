class Dog < ActiveRecord::Base
  attr_accessible :avatar, :headline, :information
  mount_uploader :avatar, AvatarUploader
end
