class Category < ActiveRecord::Base
  attr_accessible :name, :slug
  has_many :posts
end
