class AnimesController < ApplicationController
  def index
    @animes = Anime.all
  end

  def show
    @anime = Anime.find params[:id]
    if user_signed_in?
      @animelist = current_user.animelists.new
    end
  end

  def favorite
    @anime = Anime.find params[:id]
    current_user.mark_as_favorite @anime

    respond_to do |format|
			format.html {redirect_to @anime}
			format.js
    end
  end

  def unfavorite
    @anime = Anime.find params[:id]
    @anime.unmark :favorite, :by => current_user

    respond_to do |format|
      format.html {redirect_to @anime}
      format.js
    end
  end
end
