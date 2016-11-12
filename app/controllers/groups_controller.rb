class GroupsController < ApplicationController

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find params[:id]
    @new_comment = Comment.build_from(@group, current_user.id, "")
    @comments = @group.comment_threads
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user_id = current_user.id
    if @group.save
      redirect_to @group
    else
      render :new
    end
  end

  def edit
    @group = Group.find params[:id]
  end

  def update
    @group = Group.find params[:id]
    if @group.update(group_params)
      redirect_to @group
    else
      render :edit
    end
  end

  def destroy
    @group = Group.find params[:id]
    @group.destroy
    redirect_to groups_path
  end

  def join
    @group = Group.find params[:id]
    current_user.mark_as_join @group

    respond_to do |format|
      flash.now[:success] = "You just joined #{@group.title}!!"
			format.html {redirect_to @group}
			format.js
    end
  end

  def unjoin
    @group = Group.find params[:id]
    @group.unmark :join, by: current_user

    respond_to do |format|
      flash.now[:alert] = "You just left #{@group.title} :("
      format.html {redirect_to @group}
      format.js
    end
  end

  private
    def group_params
      params.require(:group).permit(:title, :bio, :summary, :avatar, :header_image)
    end

end
