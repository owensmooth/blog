FactoryBot.define do
  sequence :title do |n|
    "Test post #{n}"
  end

  factory :article do
    title
    text "test123123"
  end

  factory :user do
    name 'test'
    email 'test@test.com'
    password 'password'
    password_confirmation 'password'
  end

  factory :notification do
    email 'test@test.com'
  end
end
