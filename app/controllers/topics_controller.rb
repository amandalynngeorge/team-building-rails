class TopicsController < ApplicationController
  before_action :find_topic, only: [:show, :edit, :update, :destroy]
  # before_action :require_login

  def new
  end

  def index
    @topics = Topic.all
  end

  def show
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to topic_path(@topic)
    else
      render 'new'
    end
  end


  private
    def find_topic
      @topic = Topic.find_by(name: params[:name])
    end

    def topic_params
      params.require(:topic).permit(:name)
    end


end
