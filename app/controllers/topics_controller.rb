class TopicsController < ApplicationController
  before_action :require_login

  def new
    @topic = Topic.new
  end

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find_by(id: params[:id])
    respond_to do |f|
      f.html {render :show}
      f.json {render json: @topic}
    end
  end

  def create
    @topic = Topic.create(topic_params)
  end

private
  def topic_params
    params.require(:topic).permit(:name)
  end
end
