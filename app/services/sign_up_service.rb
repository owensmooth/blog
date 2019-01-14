class SignUpService
  attr_accessor :notification

  def initialize(notification:)
    @notification = notification
  end

  def self.call(*args)
    new(*args).call
  end

  def call
    NotificationMailer.signup_email(notification: notification).deliver_now
  end
end