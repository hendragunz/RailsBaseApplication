class ApplicationController < ActionController::Base
  protect_from_forgery

  def logged_in?
    return true if current_user
  end

  def login_required
    return true if logged_in?
    store_location
    redirect_to new_user_session_path and return false
  end
end
