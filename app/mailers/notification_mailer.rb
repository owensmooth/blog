class NotificationMailer < ApplicationMailer
  default from: "notifications@example.com"

  def notification_email(article)
    @article = article
    @notification = Notification.all
    @notification.each do |n|
      mail(to: n.email, subject: "New blog post!!!")
    end
  end
end
