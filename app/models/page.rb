class Page < ActiveRecord::Base

  attr_accessible :title, :subtitle, :content, :posted, :sidebar, :parent_id, :show_in_navigation
  validates_presence_of :title, :content

  extend FriendlyId
  friendly_id :title, use: :slugged

  include ActsAsTree

  acts_as_tree order: "title"

  scope :active, lambda {
    where{posted.eq true}
  }
  
  default_scope order: "title ASC"
  
  def title
    read_attribute(:title).try(:titleize)
  end
  
  def subtitle
    read_attribute(:subtitle).try(:titleize)
  end

end