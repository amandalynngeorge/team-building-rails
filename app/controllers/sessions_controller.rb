class SessionsController < ApplicationController

  def new
  end

  def sign_in
  end

  def create
    if params[:username].present? && params[:username] != ""
      sessions[:username] = params[:username]
      redirect_to user_path
    else
      redirect_to home_path
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
      session.delete :username
  end

end
