require "rails_helper"

RSpec.describe NotificationMailer do
  describe "Sending an email when new article created", type: :class do
    let!(:notification) { create(:notification) }
    let(:article) { create(:article) }
    let(:mail) { NotificationMailer.notification_email() }

    it "should be valid" do
      expect(mail.from).to have_content("owen.smith@shiftcommerce.com")
      expect(mail.to).to have_content("test1@test.com")
    end
  end

    describe "Sending an email when new user signed up", type: :class do
    let!(:notification) { create(:notification) }
    let(:mail) { NotificationMailer.signup_email(notification: notification) }

    it "should be valid" do
      expect(mail.from).to have_content("owen.smith@shiftcommerce.com")
      expect(mail.to).to have_content("test2@test.com")
    end
  end
end