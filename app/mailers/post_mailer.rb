class PostMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.post_mailer.post_notification.subject
  #
  def post_notification(post)
    @topic = post.topic
    @user = post.user
    @post = post
    mail to: @user.email, subject: "You just created a post"
  end
end
