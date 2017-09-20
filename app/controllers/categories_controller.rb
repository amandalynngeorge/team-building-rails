class CategoriesController < ApplicationController
  before_action :require_login

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    respond_to do |f|
      f.html {render :show}
      f.json {render json: @category}
    end
  end
end
