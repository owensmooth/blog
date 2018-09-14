class NotificationMailer < ApplicationMailer

  def notification_email(article)
    @article = article
    @notification = Notification.all
    @notification.each do |n|
      mail(
        subject: 'New blog post!!!',
        to: n.email,
        from: 'owen.smith@shiftcommerce.com',
        track_opens: 'true')
    end
  end
end