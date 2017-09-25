class UsersController < ApplicationController
  before_action :require_login, only: [:show, :index]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:message] = "Welcome!"
      redirect_to categories_path
    else
      render 'new'
    end
  end

  # ToDO:
  # 1. is move this JSON API route to /users/:user_id/activities
  # 2. Sorting the activities by time_needed in your JS
  def show
    @activity = Activity.new
    @activity.topics.build
    @user = User.find_by(id: params[:id])
  end

  def index
    @user = User.find_by(id: params[:id])
  end

private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
