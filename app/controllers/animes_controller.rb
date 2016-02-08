class AnimesController < ApplicationController
  def index
    @animes = Anime.all
  end

  def show
    @anime = Anime.friendly.find(params[:id])
    @animelist = Animelist.new
  end
end
