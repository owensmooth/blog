require "rails_helper"

RSpec.describe "Articles" do
  describe "viewing articles" do
    let!(:articles) { create_list(:article, 4) }

    it "should display the articles" do
      visit articles_path

      articles.each do |article|
        expect(page).to have_content(article.title.upcase)
      end
    end
  end

  context "adding an article" do
    describe "with valid data" do
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
        http_auth

        visit new_admin_article_path

        fill_in "Title", with: "Flap"
        fill_in "Text", with: "bird"

        click_button "Create Article"

        expect(page).to have_content "Title is too short"
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