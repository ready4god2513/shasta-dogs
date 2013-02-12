class Post < ActiveRecord::Base
  
  attr_accessible :title, :subtitle, :content, :posted
  validates_presence_of :title, :content
  
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  scope :active, lambda {
    where{posted.eq true}
  }
  
  scope :recent, lambda {
    order("created_at DESC").limit(10)
  }
  
end