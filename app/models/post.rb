class Post < ActiveRecord::Base

  has_many :images, as: :imageable
  
  attr_accessible :title, :subtitle, :content, :posted, 
    :category, :category_id, :images_attributes, :synopsis
  accepts_nested_attributes_for :images, :reject_if => :all_blank, :allow_destroy => true
  
  validates_presence_of :title, :content
  
  belongs_to :category
  
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  scope :active, lambda {
    where{posted.eq true}
  }
  
  scope :recent, lambda {
    order("created_at DESC").limit(10)
  }
  
end