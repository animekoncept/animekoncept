class AnimesController < ApplicationController
  def index
    @animes = Anime.facets_search(params)

  end

  def show
    @anime = Anime.find params[:id]
    @anime.punch(request)
    if user_signed_in?
      @animelist = current_user.animelists.new
    end
  end

  def favorite
    @anime = Anime.find params[:id]
    current_user.mark_as_favorite @anime

    @anime.create_activity :favorite, owner: current_user

    respond_to do |format|
			format.html {redirect_to @anime}
			format.js
    end
  end

  def unfavorite
    @anime = Anime.find params[:id]
    @anime.unmark :favorite, :by => current_user

    @anime.create_activity :unfavorite, owner: current_user

    respond_to do |format|
      format.html {redirect_to @anime}
      format.js
    end
  end
end
