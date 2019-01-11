class NewPostService
  def self.call
    new.call
  end

  def call
    NotificationMailer.notification_email.deliver_now
  end
end