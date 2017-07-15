class ActivitiesController < ApplicationController
  before_action :find_activity, only: [:show, :edit, :update, :destroy]

  def new
    @activity = Activity.new
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
      @activity = Activity.find(params[:id])
    end
end
