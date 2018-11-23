class SignUpService
  attr_accessor :notification

  def initialize(notification:)
    @notification = notification
  end

  def self.call(*args)
    new(*args).call
  end

  def call
    EmailWorker.perform.signup_email(notification: notification)
  end
end