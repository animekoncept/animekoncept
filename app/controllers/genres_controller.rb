class GenresController < ApplicationController

  def show
    @genre = Genre.find params[:id]
    @genres = Genre.all.order(:title)
    @animes = @genre.animes
  end
end
