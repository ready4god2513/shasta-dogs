class Page < ActiveRecord::Base
  
  attr_accessible :title, :subtitle, :content, :posted
  
  extend FriendlyId
  friendly_id :title, use: :slugged
  
end