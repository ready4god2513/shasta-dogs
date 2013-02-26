class DogsController < InheritedResources::Base
  
  has_scope :past_including_today, type: :boolean, default: true
  load_and_authorize_resource
  
end