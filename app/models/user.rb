class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :email, :password, :password_confirmation, :surname, :first_name, :surname_kana, :first_name_kana, :phone, :card_number, 
            :expiration_month, :expiration_year, :security_code, :birth_year, :birth_month, :birth_day, presence: true
end





#   validates :email, :password, :password_confirmation, presence: true
# end


