class ActivitiesController < ApplicationController
  before_action :find_activity, only: [:show, :edit, :update, :destroy]
  before_action :require_login

  def new
    @activity = Activity.new
    @activity.topics.build
  end

  def create
    @activity = current_user.activities.build(activity_params)
    if @activity.save
      redirect_to activity_path(@activity)
    else
      render 'new'
    end
  end

  def index
    @activities = Activity.all.alpha
  end

  def show
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

  def order
    @activities = Activities.all.short_to_long
  end

  def destroy
    @activity.destroy
    redirect_to activities_path
  end

private
  def find_activity
    @activity = Activity.find_by(id: params[:id])
  end

  def activity_params
    params.require(:activity).permit(:title, :description, :goal, :rules, :time, :category_id, topic_attributes:[:name])
  end
end
