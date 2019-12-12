# README



## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null:false|
|email|string|null: false, unique: true|
|password|string|null: false, unique: true|
|surname|string|null: false|
|first_name|string|null: false|
|surname_kana|string|null: false|
|first_name_kana|string|null: false|
|phone|integer|null: false, unique: true|
|birthday|date|null: false|
### Association
- has_many :sns_credentials, dependent: :destroy
- has_many :items, dependent: :destroy
- has_many :cards, dependent: :destroy
- has_many :addresses, dependent: :destroy
- has_many :comments



## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|user|references|null: false, foreign_key: true|
|category|integer|null: false|
|detail|text|null: false|
|price|integer|null: false|
|status|integer|null: false, default: 0|
|state|integer|null: false, default: 0|
|city|integer|null: false|
|fee_payer|integer|null: false|
|delivery_time|integer|null: false|
|delivery|integer|null: false|

### Association
- belongs_to :user
- has_many :images, dependent: :destroy
- accepts_nested_attributes_for :images, allow_destroy: true
- has_many :comments



## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null:false, foreign_key: true|
|post_code|string|null:false|
|prefecture|integer|null:false|
|city|string|null: false|
|street|string|null:false|
|building|string|
|phone|integer|
|surname|string|null: false|
|first_name|string|null: false|
|surname_kana|string|null: false|
|first_name_kana|string|null: false|
### Association
- belongs_to :user



## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null:false|
|item|references|null:false, foreign_key: true|
### Association
- belongs_to :item
- mount_uploader :image, ImageUploader



## main_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
### Association
- has_many :sub_categories



## sub_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|main_category_id|references|null:false, foreign_key: true|
|name|string|null:false|
### Association
- belongs_to :main_category
- has_many :sub2_categories


## sub2_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|sub_category_id|references|null:false, foreign_key: true|
|name|string|null:false|
### Association
- belongs_to :sub_category



## sns_credentialsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key: true|
|uid|string|
|provider|string|
### Association
- belongs_to :user



## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null:false, foreign_key: true|
|item_id|integer|null:false, foreign_key: true|
|text|text|
### Association
- belongs_to :user
- belongs_to :item



## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false, foreign_key: true|
|customer_id|string|
|card_id|string|
|token|string|
### Association
- belongs_to :user