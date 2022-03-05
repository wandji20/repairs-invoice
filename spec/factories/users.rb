FactoryBot.define do
  factory :user do
    admin { false }
    username { Faker::Name.unique.name }
    email { Faker::Internet.unique.email }
    password { 111_111 }
    password_confirmation { 111_111 }
  end
end
