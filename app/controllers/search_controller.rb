class SearchController < ApplicationController
  def index
    @search = Searchkick.search(params[:query])
  end
end
