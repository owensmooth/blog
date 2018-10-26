class Notification < ApplicationRecord

  after_create :send_notification

  def send_notification
    SignUpService.call(self)
  end
end
