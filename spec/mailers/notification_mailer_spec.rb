require "rails_helper"

describe "Mailer", :type => :mailer do
  let!(:notification) { create(:notification) }
  let(:article) { create(:article) }
  let(:mail) { NotificationMailer.notification_email(article) }

  it "Sends a email when new article created" do
    expect(mail.from).to have_content("notifications@example.com")
    expect(mail.to).to have_content("test@test.com")
  end

  it "Sends a email with correct details" do
    user = create :user
    mail = UserMailer.with(user: user).welcome_email

    expect(mail.subject).to match("Welcome to the Blog")
    expect(mail.body.encoded).to have_content("Welcome to onsmooth dev blog")
  end
end
