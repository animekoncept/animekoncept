class TopicsController < ApplicationController

  def index
    @topics = Topic.descending.includes(:posts)
  end

  def show
    @topic = Topic.find params[:id]
    @post = Post.new
    @posts = @topic.posts
    @topic.punch(request)
  end

  def new
    @topic = Topic.new
  end

  def create
    @category = Category.find params[:category_id]
    @topic = Topic.new(topics_params)
    @topic.user_id = current_user.id
    @topic.category_id = @category.id
    if @topic.save
      TopicMailer.topic_notification(@topic).deliver
      redirect_to @topic
    else
      render :new
    end
  end

  def top
    #Top views
    @topics = Topic.most_hit(7.day.ago, 100)
  end

  def latest
    @topics = Topic.all.order("created_at desc")
  end

  private
    def topics_params
      params.require(:topic).permit(:title, :content)
    end
end
