class Notification < ApplicationRecord

    after_create :send_notification

  def send_notification
    EmailService.new({user: self}).notification_signup
  end
end
