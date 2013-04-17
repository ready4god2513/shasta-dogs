class Page < ActiveRecord::Base

  has_many :images, as: :imageable

  attr_accessible :title, :subtitle, :content, :posted, :sidebar, 
    :parent_id, :show_in_navigation, :full_page_width, :images_attributes

  accepts_nested_attributes_for :images, :reject_if => :all_blank, :allow_destroy => true
  validates_presence_of :title, :content

  extend FriendlyId
  friendly_id :title, use: :slugged

  include ActsAsTree

  acts_as_tree order: "title"

  scope :active, lambda {
    where{posted.eq true}
  }
  
  default_scope order: "title ASC"
  after_save :generate_sitemap
  
  def title
    read_attribute(:title).try(:titleize)
  end
  
  def subtitle
    read_attribute(:subtitle).try(:titleize)
  end

  def generate_sitemap
    SiteMap.generate
  end

end