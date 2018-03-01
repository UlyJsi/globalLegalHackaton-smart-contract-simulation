class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in? # views "see" these methods

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id] # return current(logged) user (object) or look for user with specified :id
  end

  def logged_in?
    !!current_user # ?????????
  end

  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform this action. "
      redirect_to root_path
    end
  end

end
