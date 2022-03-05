FactoryBot.define do
  factory :part do
    name { Faker::Name.unique.name }
    price { Faker::Number.decimal }
    total { Faker::Number.number(digits: 4) }
  end
end
