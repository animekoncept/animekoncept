class ReviewsController < ApplicationController

  def show
    @review = Review.find params[:id]
    @anime = @review.anime
  end
  def new
    @anime = Anime.find params[:anime_id]
    @review = Review.new
  end

  def create
    @anime = Anime.find params[:anime_id]
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.anime_id = @anime.id
    if @review.save
      redirect_to @anime
    else
      render :new
    end
  end

  private
    def review_params
      params.require(:review).permit(:content, :story, :sound, :character, :enjoyment, :overall, :art)
    end
end
