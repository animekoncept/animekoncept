class TopicMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.topic_mailer.topic_notification.subject
  #
  def topic_notification(topic)
    @topic = topic
    @user  = topic.user
    mail to: @user.email, subject: "You just created a topic in #{@topic.title}"
  end
end
