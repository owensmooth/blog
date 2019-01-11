require "rails_helper"

RSpec.describe NewPostService, type: :mailer do
  describe "Sending an email to all users when new article created", type: :mailer do
    let(:article) { create(:article) }
    let!(:notification) { create(:notification) }
    let(:mail) { NewPostService.call }

    it "should be valid and be sent to all users" do
      expect(mail.from).to have_content("owen.smith@shiftcommerce.com")
      expect(mail.to).to have_content("test3@test.com")
      expect(mail.subject).to match("New blog post!!!")
      expect(mail.body.encoded).to match("Hi, a new article has been posted")
    end
  end
end