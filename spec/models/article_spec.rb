require "rails_helper"

RSpec.describe Article, type: :model do
  it "can be created" do
    expect(Article.new(title: "Testing", text: "Test" )).to be_valid
  end
end

RSpec.describe Article, type: :model do
  it "wont create article because of article params" do
    expect(Article.new(title: "Test", text: "Test" )).not_to be_valid
  end
end

RSpec.describe Article, type: :model do
  let(:article) { Article.new(title: "Testing", text:"test123") }
  it "can be edited" do
    article.update(title: "Testing123", text: "123121231")
    expect(article).to have_attributes(title: "Testing123")
  end
end

RSpec.describe Article, type: :model do
  let(:article) { build(:article) }
  it "can be viewed" do

    expect(article).to have_attributes(title: article.title)
    expect(article).to have_attributes(text: article.text)
  end
end
