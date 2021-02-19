FactoryBot.define do
  factory :item do
    product_name              {"sample999"}
    product_description       {Faker::Lorem.sentence}
    category_id               {"2"}
    product_condition_id      {"2"}
    delivery_fee_id           {"2"}
    delivery_area_id          {"2"}
    delivery_day_id           {"2"}
    price                     {"999"}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
