FactoryBot.define do
  factory :user do
    name {"test"}
    email {"test@test.com"}
    password {"password"}
    password_confirmation {"password"}
  end

  factory :notification do
    sequence(:email) { |n| "test#{n}@test.com"}
  end
end
