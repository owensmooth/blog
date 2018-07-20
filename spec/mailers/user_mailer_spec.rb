require "rails_helper"

describe "Mailer" do
  it "Sends a email with correct details" do
    @email = 
    expect(email.from).to have_content("me@example.com")
    expect(email.to).to have_content("friend@example.com")
  end
end
