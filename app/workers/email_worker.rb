class EmailWorker
  include Sidekiq::Worker

  def perform(notification)
    NotificationMailer.signup_email(notification: notification).deliver_now
  end
end