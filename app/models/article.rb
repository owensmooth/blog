class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5 }

  after_create :send_notification

  def send_notification
    NotificationMailer.notification_email(self).deliver_later
  end
end
