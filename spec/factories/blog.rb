FactoryBot.define do
  factory :user do
    name {"test"}
    email {"test@test.com"}
    password {"password"}
    password_confirmation {"password"}
  end

  factory :notification do
    email {"test@test.com" "test123@test.com"}
  end
end
