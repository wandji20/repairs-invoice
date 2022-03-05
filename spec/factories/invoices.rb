FactoryBot.define do
  factory :invoice do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    status { 0 }
    user
  end
end
