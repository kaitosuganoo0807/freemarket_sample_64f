# README



## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null:false|・
|email|string|null: false, unique: true|
|password|string|null: false, unique: true|
|surname|string|null: false|
|first_name|string|null: false|
|surname_kana|string|null: false|
|first_name_kana|string|null: false|
|phone|integer|null: false, unique: true|
|card_number|integer|null: false|
|expiration_month|integer|null: false|
|expiration_year|integer|null: false|
|security_code|integer|null: falase|
|icon|string|
|introduction|text|
|birth_year|integer|
|birth_month|integer|
|birth_day|integer|
### Association
has_many :item_comments
has_many :sns_credentials, dependent: :destroy
has_one :address
has_many :items, dependent: :destroy
has_many :transaction_users, dependent: :destroy
has_many :transactions, through: :transaction_users, dependent: :destroy
has_many :transaction_comments, dependent: :
has_many :rates
has_many :likes



## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|user_id|integer|null: false, foreign_key: true|
|category_id|integer|null:false, foreign_key: true|
|brand_id|integer|foreign_key: true|
|size_id|integer|foreign_key: true|
|condition|text|null: false, foreign_key: true|
|postage_id|integer|null:false, foreign_key: true|
|shipping_method_id|integer|null: false, foreign_key: true|
|shipping_date_id|integer|null: false, foreign_key: true|
|price|integer|null: false|
|description|text|null:false|
|likes_count|integer|
### Association
has_many :likes, dependent: :destroy
has_many :transactions, dependent: :destroy
belongs_to :user
belongs_to :condition
has_many :category_items, dependent: :destroy
has_many :categorys, through: :category_items
belongs_to :shipping_time
belongs_to :profit
has_many :images, dependent: :destroy
belongs_to :brand
belongs_to :postage
belongs_to :shipping_method
belongs_to :size
has_many :item_comments
belongs_to :item_condition
belongs_to_active_hash :prefecture



## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null:false, foreign_key: true|
|post_code|integer|null:false|
|city|string|null: false|
|district_number|integer|null:false|
|building_name|string|
|building_phone|integer|
### Association
belongs_to :user
belongs_to_active_hash :prefecture



## item_commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|null:false|
|user_id|integer|null:false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
### Association
belongs_to :user
belongs_to :item



## process_commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|null:false|
|user_id|integer|null:false, foreign_key: true|
|process_id|integer|null: false, foreign_key: true|
### Association
belongs_to :transactions
belongs_to :user



## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null:false|
|item_id|integer|null:false, foreign_key: true|
### Association
belongs_to :item



## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|parent_id|integer|
### Association
has_many :category_items, dependent: :destroy
has_many :items, through: :category_items, dependent: :destroy
belongs_to :size
belongs_to :parent, class_name: :Category
has_many :children, class_name: :Category, foreign_key: :parent_id



## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
### Association
has_many :items
has_many :categories



## ratesテーブル
|Column|Type|Options|
|------|----|-------|
|rate|string|
|user_id|integer|null:false, foreign_key: true|
|comment|text|
|process_id|integer|null:false, foreign_key: true|
### Association
belongs_to :user
belongs_to :rate 



## sns_credentialsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key: true|
|uid|string|
|provider|string|
### Association
belongs_to :user



## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null:false, foreign_key: true|
|item_id|integer|null:false, foreign_key: true|
### Association
belongs_to :user
belongs_to :item



## transactionsテーブル
|Column|Type|Options|
|------|----|-------|
|transaction_state_id|integer|null:false, foreign_key: true|
|user_id|integer|null:false, foreign_key: true|
|item_id|integer|null:false, foreign_key: true|
|buyer_id|integer|null:false, foreign_key: true|
### Association
has_many :transaction_users, dependent: :destroy
has_many :users, through: :transaction_users, dependent: :destroy
belongs_to :item
belongs_to :transaction_state
belongs_to :buyer, class_name: "User"



## transaction_statesテーブル
|Column|Type|Options|
|------|----|-------|
|state|string|
### Association
has_many :transactions



## transaction_usersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null:false, foreign_key: true|
|transaction_id|integer|null:false, foreign_key: true|
### Association
belongs_to :transaction
belongs_to :user



## transaction_commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null:false, foreign_key: true|
|comment|text|null: false|
|transaction_id|integer|null:false, foreign_key: true|
### Association
belongs_to :transactions
belongs_to :user



## item_conditionsテーブル
|Column|Type|Options|
|------|----|-------|
|state|string|null:false|
### Association
has_many :items



## conditionsテーブル
|Column|Type|Options|
|------|----|-------|
|condition|string|null:false|
### Association
has_many :items



## category_itemsテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null:false, foreign_key: true|
|category_id|integer|null:false, foreign_key: true|
### Association
belongs_to :item
belongs_to :category



## sizesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null:false, foreign_key: true|
|size|string|null: false|
### Association
has_many :items
has_many :categories



## shipping_timesテーブル
|Column|Type|Options|
|------|----|-------|
|days|integer|null:false, foreign_key: true|
### Association
has_many :items



## profitsテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null:false, foreign_key: true|
|shipping_cost|integer|null: false|
|profit|integer|null: false|
### Association
has_many :items



## postagesテーブル
|Column|Type|Options|
|------|----|-------|
|burden|string|null: false|
### Association
has_many :items



## shipping_methodsテーブル
|Column|Type|Options|
|------|----|-------|
|method|string|null: false|
### Association
has_many :items





