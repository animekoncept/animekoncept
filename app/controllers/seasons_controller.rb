class SeasonsController < ApplicationController

  def show
    @season = Season.find params[:id]
    @animes = @season.animes.limit(2)
    @all_animes = @animes.where.not(id: @animes.map(&:id)).page(params[:page]).per(42)
    @seasons = Season.all.limit(4)
    @genres = Genre.all
  end
end
