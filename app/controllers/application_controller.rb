class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :current_google_user, :logged_in_with_google?

  def current_user
    @_current_user ||= User.find_by(id: session[:current_user_id])
  end

  # delete these two methods
  def current_google_user
    current_google_user ||= Googleuser.find_by(id: session[:current_google_user_id])
  end
  def logged_in_with_google?
    current_google_user != nil
  end

  def logged_in?
    current_user != nil
  end
end
