require 'rails_helper'

describe User do
  describe '#create' do

    # it "is valid with a nickname, email, duplicate_email_address, password, password_confirmation, surname, first_name, surname_kana, first_name_kana, phone, card_number, expiration_month, expiration_year, security_code, birth_year, birth_month, birth_month" do
    #   user = build(:user)
    #   expect(user).to be_valid
    # end

    it "is invalid without a nickname" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "is invalid without a email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    # it "is invalid with a duplicate_email_address" do
    #   user = create(:user)
    #   another_user = build(:user, email: user.email)
    #   another_user.valid?
    #   expect(another_user.errors[:email]).to include("has already been taken")
    # end

    it "is invalid without a password" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    # it "is invalid without a password_confirmation although with a password" do
    #   user = build(:user, password_confirmation: "")
    #   user.valid?
    #   expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    # end

    # it "is invalid without a password_confirmation" do
    #   user = build(:user, password_confirmation: "")
    #   user.valid?
    #   expect(user.errors[:password_confirmation]).to include("can't be blank")
    # end

    it "is invalid without a surname" do
      user = build(:user, surname: "")
      user.valid?
      expect(user.errors[:surname]).to include("can't be blank")
    end

    it "is invalid without a first_name" do
      user = build(:user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    it "is invalid without a surname_kana" do
      user = build(:user, surname_kana: "")
      user.valid?
      expect(user.errors[:surname_kana]).to include("can't be blank")
    end

    it "is invalid without a first_name_kana" do
      user = build(:user, first_name_kana: "")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end

    it "is invalid without a phone" do
      user = build(:user, phone: "")
      user.valid?
      expect(user.errors[:phone]).to include("can't be blank")
    end

    it "is invalid without a card_number" do
      user = build(:user, card_number: "")
      user.valid?
      expect(user.errors[:card_number]).to include("can't be blank")
    end

    it "is invalid without a expiration_month" do
      user = build(:user, expiration_month: "")
      user.valid?
      expect(user.errors[:expiration_month]).to include("can't be blank")
    end

    it "is invalid without a expiration_year" do
      user = build(:user, expiration_year: "")
      user.valid?
      expect(user.errors[:expiration_year]).to include("can't be blank")
    end

    it "is invalid without a security_code" do
      user = build(:user, security_code: "")
      user.valid?
      expect(user.errors[:security_code]).to include("can't be blank")
    end

    it "is invalid without a birth_year" do
      user = build(:user, birth_year: "")
      user.valid?
      expect(user.errors[:birth_year]).to include("can't be blank")
    end

    it "is invalid without a birth_month" do
      user = build(:user, birth_month: "")
      user.valid?
      expect(user.errors[:birth_month]).to include("can't be blank")
    end
    
    it "is invalid without a birth_day" do
      user = build(:user, birth_day: "")
      user.valid?
      expect(user.errors[:birth_day]).to include("can't be blank")
    end
  end
end


#     it "is invalid without an email" do
#      user = User.new(email: "")
#      user.valid?
#      expect(user.errors[:email]).to include("can't be blank")
#     end



