FactoryBot.define do
  factory :item do
    product_name           { "名前" }
    description_of_item    { "説明" }
    product_category_id    { 2 }
    commodity_condition_id { 2 }
    shipping_charge_id     { 2 }
    region_of_origin_id    { 2 }
    days_of_ship_id        { 2 }
    price                  { 2000 }

    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end


