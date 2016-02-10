class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
   protect_from_forgery with: :exception
  
protected
  
  def current_user
    @current_user ||= User.find_by(token: session[:token])
  end
  helper_method :current_user
  
  def current_user?
    current_user.present?
  end
  helper_method :current_user?
  
  def authenticate_user!
    unless current_user?
      redirect_to root_path, alert: 'Please login first'
    end
  end
end
