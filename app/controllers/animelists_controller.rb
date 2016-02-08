class AnimelistsController < ApplicationController

  def show
    @user = User.friendly.find(params[:user_id])
    @animelists = @user.animelists
  end
end
