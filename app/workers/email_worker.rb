class EmailWorker
  include Sidekiq::Worker
  def perform
    def notification_email
      notifications = Notification.all
      notifications.each do |notification|
        mail(
          subject: 'New blog post!!!',
          to: notification.email,
          from: 'owen.smith@shiftcommerce.com',
          track_opens: 'true'
        )
      end
    end

    def signup_email(notification:)
      mail(
        subject: 'Welcome',
        to: notification.email,
        from: 'owen.smith@shiftcommerce.com',
        track_opens: 'true'
      )
    end
  end
end