FactoryBot.define do

  factory :user do
    nickname              {""} 
    email                 {""}
    password              {""}
    password_confirmation {""}
    surname               {""}
    first_name            {""}
    surname_kana          {""}
    first_name_kana       {""}
    phone                 {""} 
    card_number           {""}
    expiration_month      {""}
    expiration_year       {""}
    security_code         {""}
    birth_year            {""}
    birth_month           {""}
    birth_day             {""}
  end

end