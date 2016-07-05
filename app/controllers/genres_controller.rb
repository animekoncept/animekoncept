class GenresController < ApplicationController

  def show
    @genre = Genre.find params[:id]
    @genres = Genre.all.order(:title)
    @animes = @genre.animes.limit(2)
    @all_animes = @animes.where.not(id: @animes.map(&:id)).page(params[:page]).per(42)
  end
end
