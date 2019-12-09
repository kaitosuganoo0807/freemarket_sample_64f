require 'rails_helper'

describe User do
  describe '#create' do

    it "is invalid without a nickname" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "is invalid without a email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end  

    it "is invalid without a password" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "is invalid without a password_confirmation" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("を入力してください")
    end

    it "is invalid without a surname" do
      user = build(:user, surname: "")
      user.valid?
      expect(user.errors[:surname]).to include("を入力してください")
    end

    it "is invalid without a first_name" do
      user = build(:user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end

    it "is invalid without a surname_kana" do
      user = build(:user, surname_kana: "")
      user.valid?
      expect(user.errors[:surname_kana]).to include("を入力してください")
    end

    it "is invalid without a first_name_kana" do
      user = build(:user, first_name_kana: "")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください")
    end

    it "is invalid without a phone" do
      user = build(:user, phone: "")
      user.valid?
      expect(user.errors[:phone]).to include("を入力してください")
    end

    it "is invalid without a card_number" do
      user = build(:user, card_number: "")
      user.valid?
      expect(user.errors[:card_number]).to include("を入力してください")
    end

    it "is invalid without a expiration_month" do
      user = build(:user, expiration_month: "")
      user.valid?
      expect(user.errors[:expiration_month]).to include("を入力してください")
    end

    it "is invalid without a expiration_year" do
      user = build(:user, expiration_year: "")
      user.valid?
      expect(user.errors[:expiration_year]).to include("を入力してください")
    end

    it "is invalid without a security_code" do
      user = build(:user, security_code: "")
      user.valid?
      expect(user.errors[:security_code]).to include("を入力してください")
    end

    it "is invalid without a birth_year" do
      user = build(:user, birth_year: "")
      user.valid?
      expect(user.errors[:birth_year]).to include("を入力してください")
    end

    it "is invalid without a birth_month" do
      user = build(:user, birth_month: "")
      user.valid?
      expect(user.errors[:birth_month]).to include("を入力してください")
    end
    
    it "is invalid without a birth_day" do
      user = build(:user, birth_day: "")
      user.valid?
      expect(user.errors[:birth_day]).to include("を入力してください")
    end
  end
end

