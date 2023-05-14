class PurchasingShippingAddress
  include ActiveModel::Model
  attr_accessor :post_code, :region_of_origin_id, :municipalities, :address, :building, :telephone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :municipalities
    validates :address
    validates :telephone_number, format: {with: /\A\d{10,11}\z/}
  end

  validates :region_of_origin_id, numericality: { other_than: 1 , message: "can't be blank"}

  def save
    purchasing = Purchasing.create(user_id: user_id, item_id: item_id)

    ShippingAddress.create(post_code: post_code, region_of_origin_id: region_of_origin_id, municipalities: municipalities, address: address, building: building, telephone_number: telephone_number)
  end
end