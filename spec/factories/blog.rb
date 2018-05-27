FactoryBot.define do
  sequence :title do |n|
    "Test post #{n}"
  end

  factory :article do
    title 
    text "test123123"
  end
end
