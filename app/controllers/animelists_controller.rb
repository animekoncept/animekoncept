class AnimelistsController < ApplicationController

  def show
    @user = User.friendly.find(params[:user_id])
    @animelists = @user.animelists
  end

  def new
    @anime = Anime.friendly.find(params[:anime_id])
    @animelist = Animelist.new
  end

  def create
    @anime = Anime.friendly.find(params[:anime_id])
    @animelist = Animelist.new(animelist_params)
    @animelist.user_id = current_user.id
    @animelist.anime_id = @anime.id
    if @animelist.save
      redirect_to @anime
    else
      render :new
    end
  end

  private

    def animelist_params
      params.require(:animelist).permit(:status, :rating, :episodes_watched, :rewatched)
    end
end
