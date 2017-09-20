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

  def show
    @user = User.find_by(id: params[:id])
    @activity = @user.activities.first
    @activities = @user.activities.alpha
    respond_to do |f|
      f.html {render :show}
      f.json {render json: @user}
    end
  end

  def index
    @user = User.find_by(id: params[:id])
  end

private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
