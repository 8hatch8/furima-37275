FactoryBot.define do
  factory :contract_address do
    tel             { Faker::Number.leading_zero_number(digits: 11) }
    postal_code     { tel.slice(0, 3)+"-"+tel.slice(-4, 4) }
    prefecture_id   { Faker::Number.between(from: 1, to: 47) }
    municipality    { Gimei.address.city.kanji }
    address         { Gimei.address.town.kanji }
    building        { Faker::Address.building_number }
    item_id         { 100 }
    user_id         { 100 }
    token            {"tok_abcdefghijk00000000000000000"}
  end
end