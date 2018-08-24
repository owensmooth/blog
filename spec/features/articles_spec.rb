require "rails_helper"

RSpec.describe "Articles" do
  describe "viewing articles" do
    let!(:article) { create(:article) }

    it "should display the article" do
      visit articles_path

      expect(page).to have_content(article.title.upcase)
    end
  end

  context "adding an article" do
    describe "with valid data", js: true do
      it "should add the article" do
      http_auth

      visit new_admin_article_path

      fill_in "Title", with: "Flappy"
      fill_in "Text", with: "bird"

      click_button "Create Article"

      expect(page).to have_content("FLAPPY")
      end
    end

    describe "with invalid data" do
      it "should not add the article" do
      article = create :article
      article.title = "Test"
      
      expect(article).to_not be_valid
      expect(article.errors.messages[:title]).to eq ["is too short (minimum is 5 characters)"]
      end
    end
  end

  describe "editing an article" do
    let!(:article) { create(:article) }
    it "should be updated" do
      http_auth
      visit admin_articles_path

      click_on "Edit"
      fill_in "Text", with: "Just edited"
      click_button "Update Article"

      expect(page).to have_content("Just edited")
    end
  end

  describe "deleting an article", js: true do
    let!(:article) { create(:article) }
    it "should delete it" do
      http_auth

      visit admin_articles_path

      click_on "Destroy"
      page.driver.browser.switch_to.alert.accept
      expect(page).to_not have_content(article.title)
    end
  end
end