class SessionsController < ApplicationController

  def home
  end

  def new
    if current_user
      redirect_to home_path
    end
  end

  def create
    if params[:user_id].present? && params[:user_id] != ""
      sessions[:user_id] = params[:user_id]
      redirect_to user_path
    else
      redirect_to home_path
    end
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
      session.delete
    else
      redirect_to home_path
    end
  end

end
