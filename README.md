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

## テストユーザー

- 購入者用アカウント
  - メール:email::buyer_user@gmail.com
  - パスワード:key::buyeruser123 

- :credit_card: 購入用カード情報
  - 番号：4242424242424242
  - 期限：12/20
  - セキュリティコード：123

- 出品用アカウント
  - メール:email::seller_user@gmail.com
  - パスワード:key:selleruser123
  ※本番環境ではFacebook/Googleでのログインはできませんのでご了承ください


## 🔍工夫した点
<h3 align="center">ー 商品出品 ー</h3>
<p align="center">商品情報を保存する**Itemテーブル**と写真を保存する**Imageテーブル**のレコードを1ページで作成するように実装しました。
  accepts_nested_attributes_forをmodelで定義し、1つのformで値を送れるように実装しました。</p>

```
= form_with(model: Item, local: true)  do |f|
    ~省略〜
  = f.fields_for :images do |i|
    = i.file_field :image, multiple: true, id: "sell-img", name: "images[image][]"
```

![a4a5a9e69402506d59ae4ff00cee02f6](https://user-images.githubusercontent.com/57335336/71918286-5570de00-31c5-11ea-9570-3c4e19f5cc96.gif)

<p align="center">jQueryを用いて、登録した写真のプレビューを見れるように実装しました。また写真の削除を[非同期での通信](https://github.com/kaitosuganoo0807/freemarket_sample_64f/blob/master/app/assets/javascripts/item_image.js)で可能にしました。</p>

![3c8491eca840f4b91e9256eebff5e058](https://user-images.githubusercontent.com/57335336/71918845-9289a000-31c6-11ea-930d-d2e5b48ee41b.gif)

--- 

<h3 align="center">ー コメント投稿機能 ー</h3>

![1e4e061ed9c8b1eda0d3313f3e19a97d](https://user-images.githubusercontent.com/57335336/71919083-2491a880-31c7-11ea-8fa2-75ad25f4e5f6.gif)

---

<h3 align="center">ー あいまい検索 ー</h3>
<p align="center">LIKE句を用いて、Itemテーブルのnameカラムと入力した値が合致したレコードを取得できるように実装しました。</p>

```
def self.search(search)
    return Item.all unless search
    Item.where(['name LIKE ?', "%#{search}%"])
  end
end
```

![6f8c89acca5e618c9396afcc22f1f8af](https://user-images.githubusercontent.com/57335336/71919366-da5cf700-31c7-11ea-922d-d4b87a810cd3.gif)

---

<h3 align="center">ー 詳細検索 ー</h3>
<p align="center"> gem ransackを用いて、それぞれのカラムに入力した値と合致するレコードを取得できるように実装しました。また価格順/出品順に並び替えることもできます。</p>

![6c52f45605635fb8bfa50eb40bc66318](https://user-images.githubusercontent.com/57335336/71919606-6c64ff80-31c8-11ea-8e97-b49276e56342.gif)



# 📝DB設計



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