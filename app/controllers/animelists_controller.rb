class AnimelistsController < ApplicationController
  respond_to :html, :json

  def update
    @anime = Anime.find params[:anime_id]
    @animelist = Animelist.find_or_create_by(anime_id: @anime.id)
    @animelist.user_id = current_user.id
    @animelist.update animelist_params
    #respond_with_bip(@animelist)
    @animelist.create_activity :update, owner: current_user
    flash.now[:success] = "AnimeList has been updated!"
  end


  private

    def animelist_params
      params.require(:animelist).permit(:status, :rating, :episodes_watched, :rewatched).merge(anime_id: @anime.id)
    end
end
