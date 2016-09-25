class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @topic = Topic.find params[:topic_id]
    @post  = Post.new(post_params)
    @post.user_id = current_user.id
    @post.topic_id = @topic.id
    if @post.save
      PostMailer.post_notification(@post).deliver
      redirect_to @topic
    else
      render :new
    end
  end

  def edit
    @topic = Topic.find params[:topic_id]
    @post  = Post.find  params[:id]
  end

  def update
    @topic = Topic.find params[:topic_id]
    @post  = Post.find  params[:id]
    if @post.update(post_params)
      redirect_to @topic
    else
      render :edit
    end
  end

  def destroy
    @topic = Topic.find params[:topic_id]
    @post  = Post.find params[:id]
    @post.destroy
    redirect_to @topic
  end

  def like
    @post  = Post.find params[:id]
    current_user.mark_as_like @post

    respond_to do |format|
      format.html {redirect_to :back}
      format.js
    end
  end

  def unlike
    @post  = Post.find params[:id]
    @post.unmark :like, :by => current_user

    respond_to do |format|
      format.html {redirect_to :back}
      format.js
    end
  end

  private
    def post_params
      params.require(:post).permit(:content)
    end
end
