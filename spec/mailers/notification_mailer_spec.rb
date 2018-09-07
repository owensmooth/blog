require "rails_helper"

RSpec.describe NotificationMailer do
  describe "Sending an email when new article created", type: :mailer do
    let!(:notification) { create(:notification) }
    let(:article) { create(:article) }
    let(:mail) { NotificationMailer.notification_email(article) }

    it "should be valid" do
      expect(mail.from).to have_content("owen.smith@shiftcommerce.com")
      expect(mail.to).to have_content("test@test.com")
    end
  end
end