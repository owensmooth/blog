require "rails_helper"

describe "my special blog" do
  before do
    create :article, title: "yoloswag"
  end

  it "displays a post on the site" do
    visit "/articles"

    expect(page).to have_content("YOLOSWAG")
  end

  it "allows a user to be created" do
    user = create :user, name: "test", email: "test@test.com", password: "test123", password_confirmation: "test123"

    expect(user.name).to match("test")
    expect(user.email).to match("test@test.com")
    expect(user.password).to match("test123")
  end

  it "allows a user to input email for notifcaitions" do
    notification = create :notification, email: "testing@123.com"

    expect(notification.email).to match("testing@123.com")
  end

  context "admin" do
    it "displays a blog post listing" do
      create :article, title: "beans"
      visit_auth "/admin/articles"

  context "admin" do
    it "displays a blog post listing" do
      create :article, title: "beans"
      visit_auth "/admin/articles"

      expect(page).to have_content("yoloswag")
      expect(page).to have_content("beans")
    end

    it "creates a new blog post" do
      visit_auth "/admin/articles/new"

      fill_in "Title", with: "Flappy"
      fill_in "Text", with: "bird"

      click_button "Create Article"

      expect(page).to have_content("FLAPPY")
    end

    it "edits a blog post" do
      create :article, title: "beans"
      visit_auth "/admin/articles/#{Article.last.id}"

      expect(page).to have_content("beans")

      visit_auth "/admin/articles/#{Article.last.id}/edit"

      fill_in "Title", with: "Edited Post"
      fill_in "Text", with: "Just edited"

      click_button "Update Article"
<<<<<<< HEAD

=======
      
>>>>>>> develop
      expect(page).to have_content("EDITED POST")
    end
  end
end
