# Preview all emails at http://localhost:3000/rails/mailers/topic_mailer
class TopicMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/topic_mailer/topic_notification
  def topic_notification
    TopicMailer.topic_notification
  end

end
