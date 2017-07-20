class SessionsController < ApplicationController

  def new
  end

  def sign_in
  end

  def create
    if params[:user_id].present? && params[:user_id] != ""
      session[:user_id] = @user.id
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
    redirect to sign_in_path
  end

end
