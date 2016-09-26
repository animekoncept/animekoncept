class ReviewMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.review_mailer.review_notification.subject
  #
  def review_notification(review)
    @user = review.user
    @review = review
    @anime  = review.anime
    mail to: @user.email, subject: "You just posted a review on #{@review.anime.title}"
  end
end
