class ApplicationController < ActionController::Base
  protect_from_forgery
  
  # rescue_from CanCan::AccessDenied, with: :redirect_to_home
  # rescue_from ActionController::RoutingError, with: :redirect_to_home
  # rescue_from ActionController::UnknownController, with: :redirect_to_home
  # rescue_from AbstractController::ActionNotFound, with: :redirect_to_home
  # rescue_from ActiveRecord::RecordNotFound, with: :redirect_to_home
  
  private
  
  def redirect_to_home
    redirect_to root_path
  end
  
end