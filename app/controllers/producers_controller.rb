class ProducersController < ApplicationController

  def show
    @producer = Producer.find params[:id]
    @animes   = @producer.animes
    @seasons = Season.all.limit(4)
    @genres = Genre.all
  end
end
