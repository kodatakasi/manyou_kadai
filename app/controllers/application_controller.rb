class ApplicationController < ActionController::Base
  # heroku Basic認証
  # http_basic_authenticate_with :name => ENV["BASIC_AUTH_NAME"], :password => ENV["BASIC_AUTH_PW"] if Rails.env.production?
  
  protect_from_forgery with: :exception

  helper_method :current_user
  before_action :login_required

  class Forbidden < ActionController::ActionControllerError
  end
  rescue_from Forbidden, with: :rescue403
  rescue_from ActiveRecord::RecordNotFound, with: :render404
  rescue_from ActionController::RoutingError, with: :render404

  private
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def login_required
    redirect_to login_url unless current_user
  end

  def rescue403(e)
    @exception = e
    render template: 'errors/forbidden', status: 403
  end

  def render404
    render template: 'errors/not_found', status: 404, layout: 'application', content_type: 'text/html'
  end
end
