require "rails_helper"

RSpec.describe SignUpService do
  describe "Sending an email when signed up for notifications", type: :mailer do
    let!(:notification) { create(:notification) }
    let(:mail) {SignUpService.call(notification: notification) }

    it "should be valid" do
      expect(mail.from).to have_content("owen.smith@shiftcommerce.com")
      expect(mail.to).to have_content("test4@test.com")
      expect(mail.subject).to match("Welcome")
      expect(mail.body.encoded).to match("Hi, you are now signed up for email notifications")
    end
  end
end