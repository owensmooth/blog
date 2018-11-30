class SignUpService
  attr_accessor :notification

  def initialize(notification:)
    @notification = notification
  end

  def self.call(*args)
    new(*args).call
  end

  def call
    puts notification
    puts "signupservice"
    EmailWorker.perform_async(notification)
  end
end