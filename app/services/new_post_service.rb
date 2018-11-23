class NewPostService
  def initialize
  end

  def self.call
    new.call
  end

  def call
    EmailWorker.perform.notification_email
  end
end