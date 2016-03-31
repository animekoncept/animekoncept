class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @topic = Topic.find params[:topic_id]
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.topic_id = @topic.id
    if @post.save
      redirect_to @topic
    else
      render :new
    end
  end

  private
    def topic_params
      params.require(:post).permit(:content)
    end
end
