class ApplicationController < ActionController::Base
  http_basic_authenticate_with :name => ENV["BASIC_AUTH_NAME"], :password => ENV["BASIC_AUTH_PW"] if Rails.env.production?
  
  helper_method :current_user
  
  private
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
end
