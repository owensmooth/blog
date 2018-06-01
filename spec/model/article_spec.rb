require 'rails_helper'

RSpec.describe Article, :type => :model do
  it "can be created" do
    expect(Article.new(title: 'Testing', text: 'Test' )).to be_valid
  end
end

RSpec.describe Article, :type => :model do
  it "wont create article because of article params" do
    expect(Article.new(title: 'Test', text: 'Test' )).not_to be_valid
  end
end

RSpec.describe Article, :type => :model do
  it "can be edited" do
    @article = Article.new(title: 'Testing', text:'test123')
    @article.update(title: 'Testing123', text: '123121231')
    expect(@article).to have_attributes(title: 'Testing123')
  end
end

RSpec.describe Article, :type => :model do
  it "can be viewed" do
    @article = Article.new(title: 'Testing', text:'test123')
    expect(@article).to have_attributes(title: 'Testing', text:'test123')
  end
end
