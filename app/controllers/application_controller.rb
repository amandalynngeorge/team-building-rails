class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def current_user
    if session[:user_id].present?
      user = session[:user_id]
    end
    user
  end

  def require_login
    if !current_user
      flash[:message] = "Please sign in"
      redirect_to home_path
    end
  end


  helper_method :require_login
  helper_method :current_user
end
