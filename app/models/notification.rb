class Notification < ApplicationRecord

  validates :email, presence: true, format: { 
    with: URI::MailTo::EMAIL_REGEXP,
    message: 'Only valid emails allowed'
  } 
  
  after_create :send_notification

  def send_notification
    SignUpService.call(notification: self)
  end
end
