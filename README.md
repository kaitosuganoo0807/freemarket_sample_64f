# README

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|email|string|null:false|
|nickname|string|null:false|
|surname|string|null: false|
|first_name|string|null: false|
|surname_kana|string|null:false|
|first_name_kana|string|null:false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|

### Association




## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|category_id|integer|null:false, foreign_key: true|
|bland_id|integer|null:false|
|name|string|null: false|
|price|integer|null: false|
|description|text|null:false|
|postage|integer|null:false|
|condition|text|null: false|
|region|string|null: false|
|shipping_date|integer|null: false|

### Association




## addressesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null:false, foreign_key: true|
|post_code|integer|null:false|
|prefecture|string|null: false|
|city|string|null: false|
|street_number|integer|null:false|
|building_name|string|null:false|
|phone|integer|null: false|

### Association




## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null:false, foreign_key: true|
|text|text|null:false|
|item_id|integer|null: false, foreign_key: true|


### Association




## user_itemsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null:false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|


### Association




## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|text|null:false|
|item_id|integer|null:false, foreign_key: true|


### Association




## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|parent_id|integer|null:false|
|name|string|null:false|


### Association




## blandsテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|integer|null:false, foreign_key: true|
|name|string|null:false|


### Association




## purchasesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null:false, foreign_key: true|
|category_id|integer|null:false, foreign_key: true|


### Association




## paysテーブル

|Column|Type|Options|
|------|----|-------|
|card_number|integer|null:false|
|card_expirition_year|integer|null:false|
|card_expirition_month|integer|null:false|
|security_code|integer|null:false|


### Association
