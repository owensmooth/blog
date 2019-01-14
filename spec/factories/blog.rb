FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password }
    password_confirmation { Faker::Internet.password }
  end

  factory :notification do
    sequence(:email) { |n| "test#{n}@test.com"}
  end
end
