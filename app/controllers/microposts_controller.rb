class MicropostsController < ApplicationController
  def new
    @micropost = Micropost.new
  end

  def create
    @micropost = Micropost.new(micropost_params)
    @micropost.user_id = current_user.id
    if @micropost.save
      redirect_to root_path
    else
      render :new
    end
  end

  def like
    @micropost = Micropost.find params[:id]
    current_user.mark_as_like @micropost

    respond_to do |format|
      format.html {redirect_to :back}
      format.js
    end
  end

  def unlike
    @micropost = Micropost.find params[:id]
    @micropost.unmark :like, :by => current_user

    respond_to do |format|
      format.html {redirect_to :back}
      format.js
    end
  end

  private
    def micropost_params
      params.require(:micropost).permit(:content)
    end
end
