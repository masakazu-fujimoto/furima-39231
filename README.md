## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|E-mail|string|null: false, unique: true|
|password|string|null: false|
|name|string|null: false|
|Kana-name|string|null: false|
|date-of-birth|integer|null: false|

### Association
- has_many :items
- has_many :purchasings

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|seller|string|null: false|
|product-name|string|null: false|
|description-of-item|text|null: false|
|product-category|string|null: false|
|commodity-condition|string|null: false|
|shipping-charges|string|null: false|
|region-of-origin|string|null: false|
|days-of-ship|string|null: false|
|price|integer|null: false|

### Association
- belongs_to :user
- has_one :purchasing

## purchasingsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
|buyer|string|null: false|
|what-i-buy|string|null: false|

### Association
- belongs_to :user
- has_one :shipping-address

## shipping-addressテーブル

|Column|Type|Options|
|------|----|-------|
|purchasing_id|integer|null: false, foreign_key: true|
|post-code|integer|null: false|
|prefectures|string|null: false|
|municipalities|string|null: false|
|address|string|null: false|
|building|string|
|telephone-number|integer|null: false|

### Association
- belongs_to :purchasing