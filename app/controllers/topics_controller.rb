class TopicsController < ApplicationController
  before_action :require_login

  def new
    @topic = Topic.new
  end

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def create
    @topic = Topic.create(topic_params)
  end


  private

    def topic_params
      params.require(:topic).permit(:name)
    end


end
