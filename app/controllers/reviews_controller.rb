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
      @review.create_activity :create, owner: current_user
      ReviewMailer.review_notification(@review).deliver_now
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
