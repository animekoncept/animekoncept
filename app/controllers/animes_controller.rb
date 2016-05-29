class AnimesController < ApplicationController
  def index
    #@animes = Anime.facets_search(params).page params[:page]
    @animes = Anime.order("ended_on DESC").page(params[:page]).per(42)
  end

  def show
    @anime = Anime.find params[:id]
    @anime.punch(request)
    @reviews = @anime.reviews.limit(4).order("created_at desc")
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

  def like
    @anime = Anime.find params[:id]
    if current_user.mark_as_like @anime
      @anime.unmark :hate
    else
    end

    respond_to do |format|
      format.html {redirect_to @anime}
      format.js
    end
  end

  def unlike
    @anime = Anime.find params[:id]
    @anime.unmark :like, :by => current_user

    respond_to do |format|
      format.html {redirect_to @anime}
      format.js
    end
  end

  def hate
    @anime = Anime.find params[:id]
    if current_user.mark_as_hate @anime
      @anime.unmark :like
    end

    respond_to do |format|
      format.html {redirect_to @anime}
      format.js
    end
  end

  def unhate
    @anime = Anime.find params[:id]
    @anime.unmark :hate, :by => current_user

    respond_to do |format|
      format.html {redirect_to @anime}
      format.js
    end
  end

end
