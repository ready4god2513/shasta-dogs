class Page < ActiveRecord::Base

  attr_accessible :title, :subtitle, :content, :posted
  validates_presence_of :title, :content

  extend FriendlyId
  friendly_id :title, use: :slugged

  include ActsAsTree

  acts_as_tree order: "title"

  scope :active, lambda {
    where{posted.eq true}
  }

end