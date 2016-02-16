class SearchController < ApplicationController
  def index
    @search = PgSearch.multisearch(params[:query])
  end
end
