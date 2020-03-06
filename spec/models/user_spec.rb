require 'rails_helper'

RSpec.describe User, type: :model do

  describe "#new" do

    context 'can save' do
      it "is valid with nickname, email, password, password_confirmation, family_name, family_name_kana, birthday" do
        expect(build(:user, avatar: nil, profile: nil, phone_number: nil, sex: nil)).to be_valid
      end

      it "is valid with a password that has more than 7 letters" do
        expect(build(:user, password: "1234567", password_confirmation: "1234567")).to be_valid
      end
    end

    context 'cannot save' do
      it "is invalid without nickname" do
        user = build(:user, nickname: nil)
        user.valid?
        expect(user.errors[:nickname]).to include("can't be blank")
      end

      it "is invalid without email" do
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include("can't be blank")
      end

      it "is invalid without password" do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include("can't be blank")
      end

      it "is invalid with a password_confirmation that is different from password" do
        user = build(:user, password: "0000000", password_confirmation: "1111111")
        user.valid?
        expect(user.errors[:password_confirmation]).to include("doesn't match Password")
      end

      it "is invalid without family_name" do
        user = build(:user, family_name: nil)
        user.valid?
        expect(user.errors[:family_name]).to include("can't be blank")
      end

      it "is invalid without family_name_kana" do
        user = build(:user, family_name_kana: nil)
        user.valid?
        expect(user.errors[:family_name_kana]).to include("can't be blank")
      end

      it "is invalid without birthday" do
        user = build(:user, birthday: nil)
        user.valid?
        expect(user.errors[:birthday]).to include("can't be blank")
      end

      it "is invalid with a password that has less than 6 letters" do
        user = build(:user, password: "123456", password_confirmation: "123456")
        user.invalid?
        expect(user.errors[:password]).to include("is too short (minimum is 7 characters)")
      end

      it "is invalid with an email that doesn't have @" do
        user = build(:user, email: "kkkgmail.com")
        user.invalid?
        expect(user.errors[:email]).to include("is invalid")
      end

    end

  end
end
