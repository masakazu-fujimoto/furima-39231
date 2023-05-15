FactoryBot.define do
  factory :purchasing_shipping_address do
    post_code           { "123-4567" }
    region_of_origin_id { 2 }
    municipalities      { "代々木" }
    address             { "３丁目" }
    building            { "" }
    telephone_number    { "1234567890" }
    token               { "tok_abcdefghijk00000000000000000"}

  end
end