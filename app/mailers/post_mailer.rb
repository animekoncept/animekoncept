class PostMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.post_mailer.post_notification.subject
  #
  def post_notification
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
