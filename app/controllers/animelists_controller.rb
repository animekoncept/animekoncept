class AnimelistsController < ApplicationController

  def show
    @user = User.friendly.find(params[:user_id])
    @animelists = @user.animelists
  end

  def create
    @anime = Anime.find params[:anime_id]
    @animelist = current_user.animelists.new animelist_params
    if @animelist.save
      respond_to do |format|
        format.html {redirect_to @anime}
        format.js
      end
    end
  end

  def update
    @anime = Anime.find params[:anime_id]
    @animelist = current_user.animelists.find(params[:id])
    if @animelist.update animelist_params
      respond_to do |format|
  			format.html {redirect_to @anime}
  			format.js
      end
    end
  end

  def destroy
    @anime = Anime.find params[:anime_id]
    @animelist = current_user.animelists.find(params[:id]).destroy
  end

  private

    def animelist_params
      params.require(:animelist).permit(:status, :rating, :episodes_watched, :rewatched).merge(anime_id: @anime.id)
    end
end
