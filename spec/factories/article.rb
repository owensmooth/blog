FactoryBot.define do
  factory :article do
    title { Faker::Lorem.sentence }
    text { Faker::Lorem.paragraph(4) }
  end
end