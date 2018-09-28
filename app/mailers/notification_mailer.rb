class NotificationMailer < ApplicationMailer

  def notification_email
    @notification = Notification.all
    @notification.each do |n|
      mail(
        subject: 'New blog post!!!',
        to: n.email,
        from: 'owen.smith@shiftcommerce.com',
        track_opens: 'true'
      )
    end
  end

  def signup_email
    @user = Notification.last
    mail(
      subject: 'Welcome',
      to: @user.email,
      from: 'owen.smith@shiftcommerce.com',
      track_opens: 'true'
    )
  end
end