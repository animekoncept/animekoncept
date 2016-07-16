class AnimelistsController < ApplicationController
  respond_to :html, :json

  def update
    @anime = Anime.find params[:anime_id]
    @animelist = Animelist.find_or_create_by(anime_id: @anime.id)
    @animelist.user_id = current_user.id
    @animelist.update animelist_params
    #respond_with_bip(@animelist)
    respond_to do |format|
       format.js
     end
  end


  private

    def animelist_params
      params.require(:animelist).permit(:status, :rating, :episodes_watched, :rewatched).merge(anime_id: @anime.id)
    end
end
