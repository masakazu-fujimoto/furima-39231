class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :product_category
  belongs_to_active_hash :commodity_condition
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :region_of_origin
  belongs_to_active_hash :days_of_ship
  
  validates :image,                  presence: true
  validates :product_name,           presence: true
  validates :description_of_item,    presence: true
  validates :product_category_id,    numericality: { other_than: 1 , message: "can't be blank"}
  validates :commodity_condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_charge_id,     numericality: { other_than: 1 , message: "can't be blank"}
  validates :region_of_origin_id,    numericality: { other_than: 1 , message: "can't be blank"}
  validates :days_of_ship_id,        numericality: { other_than: 1 , message: "can't be blank"}
  validates :price,                  presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

end