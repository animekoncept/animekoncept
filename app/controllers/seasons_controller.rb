class SeasonsController < ApplicationController

  def show
    @season = Season.find params[:id]
    @animes = @season.animes
    @seasons = Season.all.limit(4)
    @genres = Genre.all
  end
end
