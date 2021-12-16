FactoryBot.define do
  factory :item do
    name                { Faker::Commerce.product_name }
    text                { Faker::Lorem.sentence }
    price               { Faker::Number.between(from: 300, to: 9_999_999) }
    category_id         { Faker::Number.between(from: 1,   to: 10) }
    condition_id        { Faker::Number.between(from: 1,   to: 6) }
    postage_payer_id    { Faker::Number.between(from: 1,   to: 2) }
    prefecture_id       { Faker::Number.between(from: 1,   to: 47) }
    preparation_days_id { Faker::Number.between(from: 1,   to: 3) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/flag.png'), filename: 'flag.png')
    end
  end
end
