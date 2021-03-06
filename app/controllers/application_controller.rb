class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :ensure_login
  def current_user
    return nil if session[:user_id].nil?
    User.find(session[:user_id])
  end

  def logged_in?
    not current_user.nil?
  end

  def ensure_login
    redirect_to login_path unless logged_in?
  end
end
