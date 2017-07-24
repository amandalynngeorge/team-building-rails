class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
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
