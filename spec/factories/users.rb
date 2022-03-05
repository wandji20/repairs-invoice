FactoryBot.define do
  factory :user do
    admin { false }
    username { Faker::Name.unique.name }
    email { Faker::Internet.unique.email }
    password { 111111 }
    password_confirmation { 111111 }
  end
end
