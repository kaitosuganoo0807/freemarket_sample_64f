class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2]
  validates :nickname, :email, :password, :password_confirmation, :surname, :first_name, :surname_kana, :first_name_kana, :phone, :card_number, 
  :expiration_month, :expiration_year, :security_code, :birth_year, :birth_month, :birth_day, presence: true
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end
end

# のちのバリデーション用にキープ
# validates :nickname, :email, :password, :password_confirmation, :surname, :first_name, :surname_kana, :first_name_kana, :phone, :card_number, 
# :expiration_month, :expiration_year, :security_code, :birth_year, :birth_month, :birth_day, presence: true
