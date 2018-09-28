class EmailService
  def initialize(params)
    @notfication = params[:notification]
  end

  def perform
    send_newpost_email
  end

  def notification_signup
    send_signup_email
  end

  private

  def send_signup_email
    NotificationMailer.signup_email().deliver_later
  end

  def send_newpost_email
    NotificationMailer.notification_email().deliver_later
  end
end