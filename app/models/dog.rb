class Dog < ActiveRecord::Base
  
  attr_accessible :avatar, :headline, :information
  mount_uploader :avatar, AvatarUploader
  
  validates :featured_day, uniqueness: true, presence: true
  validates_presence_of :avatar, :headline, :information
  
  before_validation :generate_featured_date, if: :new_record?
  
  extend FriendlyId
  friendly_id :headline, use: :slugged
  
  scope :past_including_today, lambda {
    where{featured_day.lteq my{Date.today}}.order("featured_day DESC")
  }
  
  scope :past, lambda {
    where{featured_day.lt my{Date.today}}.order("featured_day DESC")
  }
  
  
  # Check to see if we have any featured days yet.  We also need
  # to check to see if the returned day is greater than yesterday.
  # Let's return the greater of the two dates
  def self.last_taken_date
    return 1.day.ago unless Dog.any?
    res = Dog.order("featured_day DESC").limit(1).pluck(:featured_day).first
    [res, 1.day.ago.to_date].max
  end
  
  
  def self.featured
    Dog.where{featured_day.eq my{Date.today}}.limit(1).first
  end
  
  
  private
  
  def generate_featured_date
    self.featured_day = Dog.last_taken_date.advance(days: 1)
  end
  
  
end
