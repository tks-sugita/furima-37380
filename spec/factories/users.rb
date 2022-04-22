FactoryBot.define do
  factory :user do
    nickname               { 'sugita' }
    email                  { Faker::Internet.free_email }
    password               { 'password1234' }
    password_confirmation  { password }
    first_name             { '杉田' }
    last_name              { '杉田' }
    first_name_kana        { 'スギタ' }
    last_name_kana         { 'スギタ' }
    birthday               { Faker::Date.birthday }
  end
end
