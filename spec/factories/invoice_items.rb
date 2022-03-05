FactoryBot.define do
  factory :invoice_item do
    quantity { Faker::Number.number(digits: 2) }

    part
    invoice
  end
end
