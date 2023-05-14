class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.references :purchasing,        null: false, foreign_key: true
      t.string   :post_code,           null: false
      t.integer  :region_of_origin_id, null: false
      t.string   :municipalities,      null: false
      t.string   :address,             null: false
      t.string   :building,            null: false
      t.string   :telephone_number,    null: false
      t.timestamps
    end
  end
end
