FactoryBot.define do
  factory :order_address do
    zip_code { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    municipality { Faker::Address.city }
    address_number { Faker::Address.street_address }
    building_name { Faker::Address.street_address }
    tel_number { Faker::Number.decimal_part(digits: 11) }
    token { Faker::Internet.password(min_length: 20, max_length: 30) }
  end
end
