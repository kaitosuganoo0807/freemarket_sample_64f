class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :items, dependent: :destroy
  has_many :cards, dependent: :destroy
  has_one :address, dependent: :destroy
  has_many :sns_credentials, dependent: :destroy
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
  


   #omniauth_callbacks_controllerで呼び出すメソッド
  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first #firstをつけないとデータが配列で返されて使いたいメソッドが使えなくて困る

    #sns_credentialsが登録されている
    if snscredential.present?
      user = User.where(email: auth.info.email).first

      # userが登録されていない
      unless user.present?
        user = User.new(
        nickname: auth.info.name,
        email: auth.info.email,
        )
      end
      sns = snscredential
      #返り値をハッシュにして扱いやすくする  
      #活用例 info = User.find_oauth(auth) 
             #session[:nickname] = info[:user][:nickname]
      { user: user, sns: sns}

    #sns_credentialsが登録されていない
    else
      user = User.where(email: auth.info.email).first


      # userが登録されている
      if user.present?
        sns = SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id
        )

        { user: user, sns: sns}

      # userが登録されていない
      else
        user = User.new(
        nickname: auth.info.name,
        email: auth.info.email,
        )
        sns = SnsCredential.new(
          uid: uid,
          provider: provider
        )

        { user: user, sns: sns}
      end
    end
  end
end