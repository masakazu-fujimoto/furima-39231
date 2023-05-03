## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|encrypted_password|string|null: false|
|confirmation_password|string|null: false|
|name|string|null: false|
|kana_surname|string|null: false|
|kana_name|string|null: false|
|date_of_birth|date|null: false|

### Association
- has_many :items
- has_many :purchasings

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|product_name|string|null: false|
|description_of_item|text|null: false|
|product_category_id||integer|null: false|
|commodity_condition_id|integer|null: false|
|shipping_charge_id|integer|null: false|
|region_of_origin_id|integer|null: false|
|days_of_ship_id|integer|null: false|
|price|integer|null: false|

### Association
- belongs_to :user
- has_one :purchasing

## purchasingsテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping-address

## shipping_addressテーブル

|Column|Type|Options|
|------|----|-------|
|purchasing|references|null: false, foreign_key: true|
|post_code|string|null: false|
|region_of_origin_id|string|null: false|
|municipalities|string|null: false|
|address|string|null: false|
|building|string||
|telephone_number|string|null: false|

### Association
- belongs_to :purchasing