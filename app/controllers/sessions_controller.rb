class SessionsController < ApplicationController

  def new
    if current_user
      redirect_to user_path(current_user)
    end
  end

  def sign_in
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:message] = "Welcome back!"
      redirect_to activities_path
    else
      redirect_to '/sessions/new'
    end
  end

  def home
  end

  def show
    @user = current_user.username
  end

  def edit
  end

  def index
  end

  def destroy
    if session[:user_id].present?
      session.delete :user_id
    end
    redirect_to sign_in_path
  end

end
