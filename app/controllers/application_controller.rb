class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    session[:user_id] = @user.id
  end

  def logged_in?
    current_user != nil
  end

  def require_login
    unless current_user
      flash[:error] = "Please log in"
      redirect_to home_path
    end
  end

  helper_method :logged_in?
  helper_method :require_login
end
