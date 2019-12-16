class Address < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true, uniqueness: true
  validates :surname, presence: true
  validates :surname, length: { maximum: 35 }
  validates :surname, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々]|[a-zA-Z]|[ｧ-ﾝﾞﾟ]|[ａ-ｚＡ-Ｚ])+\z/i }, allow_blank: true # 全角ひらがな、全角カタカナ、漢字、半角英字、半角カタカナ、全角英字
  validates :first_name, presence: true, length: { maximum: 35 }
  validates :first_name, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々]|[a-zA-Z]|[ｧ-ﾝﾞﾟ]|[ａ-ｚＡ-Ｚ])+\z/i }, allow_blank: true # 全角ひらがな、全角カタカナ、漢字、半角英字、半角カタカナ、全角英字
  validates :surname_kana, presence: true, length: { maximum: 35 }
  validates :surname_kana, format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/ }, allow_blank: true # カタカナのみ
  validates :first_name_kana, presence: true, length: { maximum: 35 }
  validates :first_name_kana, format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/ }, allow_blank: true # カタカナのみ
  validates :post_code, presence: true
  validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "フォーマットが不適切です" }, allow_blank: true # 3桁の数字の後「-」が入り、4桁の数字が続く
  validates :city, presence: true, length: { maximum: 50 }
  validates :street, presence: true, length: { maximum: 100 }
  validates :building, length: { maximum: 100 }
end