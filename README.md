![image](https://user-images.githubusercontent.com/57335336/71912148-4e8f9e80-31b8-11ea-96ae-34f5e0a911f5.png)

<h1 align="center">Fmarket</h1>
プログラミングスクールTECH::EXPERTの最終課題で某フリーマーケットサービスのクローンサイトを作成しました。約1ヶ月間、４人チームでアジャイル開発を行いました。

<div align="center">
  <img width="100" alt="haml" src="https://user-images.githubusercontent.com/57335336/71912723-63b8fd00-31b9-11ea-8b15-9709ac1f3303.png">
  <img width="100" alt="sass" src="https://user-images.githubusercontent.com/57335336/71912795-86e3ac80-31b9-11ea-91ef-e0328c792a3b.png">
  <img width="100" alt="rails" src="https://user-images.githubusercontent.com/57335336/71912909-bbefff00-31b9-11ea-85d4-bd7a6440f0a0.png">
  <img width="100" alt="jquery" src="https://user-images.githubusercontent.com/57335336/71912989-d924cd80-31b9-11ea-9774-4765c90b2281.png">
  <img width="100" alt="aws" src="https://user-images.githubusercontent.com/57335336/71913054-f6599c00-31b9-11ea-951f-0a0201e833a3.png">
</div>
<br><br><br>

## 🌐URL
### http://52.193.251.163/
### Basic認証をかけています。ご覧の際は以下のIDとPassを入力してください。
- Basic認証
  - :id: mrcr
  - :key: 2222
<br><br><br>

# テストユーザー

- 購入者用アカウント
  - メール:email::buyer@buyer.com
  - パスワード:key::buyer123 

- :credit_card: 購入用カード情報
  - 番号：4242424242424242
  - 期限：12/20
  - セキュリティコード：123

- 出品用アカウント
  - メール:email::seller@seller.com
  - パスワード:key:seller123








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
|main_category|references|null:false, foreign_key: true|
|name|string|null:false|
### Association
- belongs_to :main_category
- has_many :sub2_categories


## sub2_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|sub_category|references|null:false, foreign_key: true|
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