require 'rails_helper'

describe 'my special blog' do
  before do
    create :article, title: 'yoloswag'
  end

  it 'displays a post on the site' do
    visit '/articles'

    expect(page).to have_content('YOLOSWAG')
  end

  context 'admin' do
    it 'displays a blog post listing' do
      create :article, title: 'beans'
      visit_auth '/admin/articles'

      expect(page).to have_content('yoloswag')
      expect(page).to have_content('beans')
    end

    it 'creates a new blog post' do
      visit_auth '/admin/articles/new'

      fill_in 'Title', with: 'Flappy'
      fill_in 'Text', with: 'bird'

      click_button 'Create Article'

      expect(current_path).to eq("/articles/#{Article.last.id}")
      expect(page).to have_content('FLAPPY')
    end

    it 'edits a blog post' do
      create :article, title: 'beans'
      visit_auth "/admin/articles/#{Article.last.id}"

      expect(page).to have_content('beans')

      visit_auth "/admin/articles/#{Article.last.id}/edit"

      fill_in 'Title', with: 'Edited Post'
      fill_in 'Text', with: 'Just edited'

      click_button 'Update Article'

      expect(current_path).to eq("/articles/#{Article.last.id}")
      expect(page).to have_content('EDITED POST')
    end
  end
end
