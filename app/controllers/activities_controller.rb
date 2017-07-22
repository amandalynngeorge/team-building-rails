class ActivitiesController < ApplicationController
  before_action :find_activity, only: [:show, :edit, :update, :destroy]
  # before_action :require_login

  def new
    @activity = Activity.new
    @activity.category = Category.find_by(id: params[:category_id])
    @activity.topics.build
  end

  def create
    @activity = Activity.new(activity_params)
    if @activity.save
      redirect_to activity_path(@activity)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @activity.update(activity_params)
      redirect_to activity_path(@activity)
    else
      render 'edit'
    end
  end

  def index
    @activities = Activity.all
  end

  def show

  end

  def destroy
  end

  private
    def find_activity
      @activity = Activity.find_by(title: params[:title])
    end

    def activity_params
      params.require(:activity).permit(:title, :description, :goal, :rules, :time, :category_id, :user_id, :topic_ids => [], :topics_attributes => [])
    end


end
