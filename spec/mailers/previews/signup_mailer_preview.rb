class NotificationMailerPreview < ActionMailer::Preview
  def signup_email
    NotificationMailer.signup_email(params[:notification])
  end
end
