class PostsController < InheritedResources::Base
  
  has_scope :active, type: :boolean, default: true, only: [:show, :index], if: lambda { |r| !r.user_signed_in? }
  load_and_authorize_resource
  
end