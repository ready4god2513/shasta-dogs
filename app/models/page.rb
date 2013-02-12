class Page < ActiveRecord::Base
  
  attr_accessible :title, :subtitle, :content, :posted
  validates_presence_of :title, :content
  
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  scope :active, lambda {
    where{posted.eq true}
  }
  
end