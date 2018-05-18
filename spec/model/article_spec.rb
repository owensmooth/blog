require 'rails_helper'

RSpec.describe Article, :type => :model do
  it "creates new article" do
    expect(Article.new(title: 'Testing', text: 'Test' )).to be_valid
  end
end

RSpec.describe Article, :type => :model do
  it "wont create article because of article params" do
    expect(Article.new(title: 'Test', text: 'Test' )).not_to be_valid
  end
end

RSpec.describe Article, :type => :model do
  it "edit article" do
    @article = Article.new(title: 'Testing', text:'test123')
    @article.update(title: 'Testing123', text: '123121231')
    expect(@article).to have_attributes(title: 'Testing123')
  end
end
