require "rails_helper"

RSpec.describe "Managing users" do
  context "signing up" do
    describe "with valid data" do
      it "should add the user" do
      user = create :user, name: "test", email: "test@test.com", password: "test123", password_confirmation: "test123"

      expect(user.name).to match("test")
      expect(user.email).to match("test@test.com")
      expect(user.password).to match("test123")
      end
    end

    describe "with invalid data" do
      it "should not add the user" do
      user = create :user
      user.email = "bar"
      
      expect(user).to_not be_valid
      expect(user.errors.messages[:email]).to eq ['is invalid']
      end
    end
  end
end