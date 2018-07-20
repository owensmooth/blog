class UserMailer < ApplicationMailer
  layout "user_mailer"
  default from: "notifications@example.com"
  def welcome_email
    @user = params[:user]
    @url = "http://localhost:3000/login"
    mail(to: @user.email, subject: "Welcome to the Blog")
  end
end
