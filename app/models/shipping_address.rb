class ShippingAddress < ApplicationRecord
  belongs_to :purchasing

  validates :post_code,           presence: true
  validates :region_of_origin_id, presence: true
  validates :municipalities,      presence: true
  validates :address,             presence: true
  validates :telephone_number,    presence: true
end