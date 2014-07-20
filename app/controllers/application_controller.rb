class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :is_admin?

  private
  def logged_in?
    current_user.present?
  end

  def current_user
    @current_user ||= session[:user_id] && User.find_by_id(session[:user_id])
  end

  def require_logged_user
    return if logged_in?
    redirect_to root_path
  end

  def is_admin?
    User.where(id: session[:user_id]).first.permission == 0
  end
end
