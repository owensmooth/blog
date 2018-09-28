# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class NotificationMailerPreview < ActionMailer::Preview
  def notification_email
    NotificationMailer.notification_email()
  end
end
