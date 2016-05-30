class GenresController < ApplicationController

  def show
    @genre = Genre.find params[:id]
    @genres = Genre.all.order(:name)
    @animes = @genre.animes
  end
end
