class NewPostService
  attr_accessor :notfication

  def initialize(notification)
    @notfification = notification
  end

  def self.call(*args)
    new(*args).call
  end

  def call
    NotificationMailer.notification_email().deliver_later
  end
end