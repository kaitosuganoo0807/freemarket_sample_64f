class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :items, dependent: :destroy
  has_one :address
  has_many :comments
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2]

         year_month_day = /\A\d{4}-\d{2}-\d{2}\z/

  validates :nickname, presence: true, length: { maximum: 20 }
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,128}+\z/i, message: "は英字と数字両方を含むパスワードを設定してください" }, allow_blank: true # 英字と数字の両方を含む7文字以上128文字以下

  validates :surname, presence: true
  validates :surname, length: { maximum: 35 }
  validates :surname, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々]|[a-zA-Z]|[ｧ-ﾝﾞﾟ]|[ａ-ｚＡ-Ｚ])+\z/i }, allow_blank: true # 全角ひらがな、全角カタカナ、漢字、半角英字、半角カタカナ、全角英字

  validates :first_name, presence: true, length: { maximum: 35 }
  validates :first_name, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々]|[a-zA-Z]|[ｧ-ﾝﾞﾟ]|[ａ-ｚＡ-Ｚ])+\z/i }, allow_blank: true # 全角ひらがな、全角カタカナ、漢字、半角英字、半角カタカナ、全角英字

  validates :surname_kana, presence: true, length: { maximum: 35 }
  validates :surname_kana, format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/ }, allow_blank: true # カタカナのみ

  validates :first_name_kana, presence: true, length: { maximum: 35 }
  validates :first_name_kana, format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/ }, allow_blank: true # カタカナのみ

  validates :birthday, presence: true, format: { with: year_month_day }

  validates :phone, presence: true, uniqueness: true
  validates :phone, format: { with: /\A\d{10}$|^\d{11}\z/, message: "登録できません" }, allow_blank: true # 10桁か11桁の数字の文字列
  


  def self.from_omniauth(auth)
    user = User.find_by(uid: auth.uid, provider: auth.provider)
    if user
      #SNSを使って登録したユーザーがいたらそのユーザーを返す
      return user
    else
      #いなかった場合はnewします。
      new_user = User.new(
        email: auth.info.email,
        nickname: auth.info.name,
        uid: auth.uid,
        provider: auth.provider,
        #パスワードにnull制約があるためFakerで適当に作ったものを突っ込んでいます
        password: Faker::Internet.password(min_length: 8,max_length: 128)
      )
      return new_user
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end
end
end
