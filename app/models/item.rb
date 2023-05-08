class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image

  validates :image,                  presence: true
  validates :user,                   presence: true
  validates :product_name,           presence: true
  validates :description_of_item,    presence: true
  validates :product_category_id,    numericality: { other_than: 1 , message: "can't be blank"}
  validates :commodity_condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_charge_id,     numericality: { other_than: 1 , message: "can't be blank"}
  validates :region_of_origin_id,    numericality: { other_than: 1 , message: "can't be blank"}
  validates :days_of_ship_id,        numericality: { other_than: 1 , message: "can't be blank"}
  validates :price,                  presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

end