FactoryBot.define do
  factory :item do
    title             { 'testname' }
    description       { 'testtitle' }
    category          { Category.all.sample }
    state             { State.all.sample }
    delivery_price    { DeliveryPrice.all.sample }
    delivery_date     { DeliveryDate.all.sample }
    prefecture        { Prefecture.all.sample }
    price             { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/apple-touch-icon.png'), filename: 'apple-touch-icon.png')
    end
  end
end
