class ActivitiesController < ApplicationController
  before_action :find_activity, only: [:show, :edit, :update, :destroy]
  before_action :require_login

  def short_to_long
    @activities = Activity.short_to_long
  end

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
    if @category = Category.find_by(id: params[:category_id])
      @activities = @category.activities.alpha
    else
      @activities = Activity.alpha
    end
  end

  def show
    respond_to do |f|
      f.html {render :show}
      f.json {render json: @activity}
      # .to_json(only: [:title, :description, :goal, :rules, :time], include: [category: {only: [:name]}])
    end
  end

  def activity_data
    @activity = Activity.find(params[:id])
# MISSING TOPICS INCLUDED IN JSON RENDER
    # render json: @activity.to_json(only: [:title, :description, :goal, :rules, :time], include: [category: {only: [:name]}])
    render json: ActivitySerializer.serialize(@activity)
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

  def destroy
    @activity.destroy
    redirect_to activities_path
  end



private
  def find_activity
    @activity = Activity.find_by(id: params[:id])
  end

  def activity_params
    params.require(:activity).permit(:title, :description, :goal, :rules, :time, :category_id, topics_attributes: [:name])
  end
end
