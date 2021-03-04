FactoryBot.define do
  factory :order do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code { '123-4567' }
    delivery_area_id { 2 }
    city { '東京都' }
    address { '1-1' }
    phone_number { '12345678901' }
  end
end
