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

  private
    def micropost_params
      params.require(:micropost).permit(:content)
    end
end
