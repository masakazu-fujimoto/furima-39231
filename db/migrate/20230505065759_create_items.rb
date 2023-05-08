class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,                null: false, foreign_key: true
      t.string :product_name,            null: false
      t.text :description_of_item,       null: false
      t.integer :product_category_id,    null: false
      t.integer :commodity_condition_id, null: false
      t.integer :shipping_charge_id,     null: false
      t.integer :region_of_origin_id,    null: false
      t.integer :days_of_ship_id,        null: false
      t.integer :price,                  null: false

      t.timestamps
    end
  end
end
