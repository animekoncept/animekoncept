class SearchController < ApplicationController
  def index
    @search = PgSearch.multisearch(params[:query])
    @animes = Anime.order("RANDOM()").limit(4)
  end
end
