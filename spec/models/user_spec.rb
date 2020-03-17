require 'rails_helper'

RSpec.describe User, type: :model do

  describe "#new" do

    context 'can save' do
      it "is valid with nickname, email, password, password_confirmation, last_name, first_name, last_name_kana, first_name_kana, birthday" do
        expeitem.validct(build(:user, avatar: nil, profile: nil, sex: nil)).to be_valid
      end

      it "is valid with a password that has more than 7 letters" do
        expect(build(:user, password: "1234567", password_confirmation: "1234567")).to be_valid
      end
    end

    context 'cannot save' do
      it "is invalid without nickname" do
        user = build(:user, nickname: nil)
        user.valid?
        expect(user.errors[:nickname]).to include("を入力してください")
      end

      it "is invalid without email" do
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include("を入力してください")
      end

      it "is invalid without password" do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include("を入力してください")
      end

      it "is invalid with a password_confirmation that is different from password" do
        user = build(:user, password: "0000000", password_confirmation: "1111111")
        user.valid?
        expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
      end

      it "is invalid without last_name" do
        user = build(:user, last_name: nil)
        user.valid?
        expect(user.errors[:last_name]).to include("を入力してください")
      end

      it "is invalid with a last_name that does not have ZENKAKU moji" do
        user = build(:user, last_name: "ｶｱｻﾝ")
        user.valid?
        expect(user.errors[:last_name]).to include("は不正な値です")
      end

      it "is invalid without first_name" do
        user = build(:user, first_name: nil)
        user.valid?
        expect(user.errors[:first_name]).to include("を入力してください")
      end

      it "is invalid with a first_name that does not have ZENKAKU moji" do
        user = build(:user, first_name: "ﾄｵｻﾝ")
        user.valid?
        expect(user.errors[:first_name]).to include("は不正な値です")
      end

      it "is invalid without last_name_kana" do
        user = build(:user, last_name_kana: nil)
        user.valid?
        expect(user.errors[:last_name_kana]).to include("を入力してください")
      end

      it "is invalid with a last_name_kana that does not have ZENKAKU moji" do
        user = build(:user, last_name_kana: "ｶｱｻﾝ")
        user.valid?
        expect(user.errors[:last_name_kana]).to include("は不正な値です")
      end

      it "is invalid without first_name_kana" do
        user = build(:user, first_name_kana: nil)
        user.valid?
        expect(user.errors[:first_name_kana]).to include("を入力してください")
      end

      it "is invalid with a first_name_kana that does not have ZENKAKU moji" do
        user = build(:user, first_name_kana: "ﾄｵｻﾝ")
        user.valid?
        expect(user.errors[:first_name_kana]).to include("は不正な値です")
      end

      it "is invalid without birthday" do
        user = build(:user, birthday: nil)
        user.valid?
        expect(user.errors[:birthday]).to include("を入力してください")
      end

      it "is invalid with a password that has less than 6 letters" do
        user = build(:user, password: "123456", password_confirmation: "123456")
        user.invalid?
        expect(user.errors[:password]).to include("は7文字以上で入力してください")
      end

      it "is invalid with an email that doesn't have @" do
        user = build(:user, email: "kkkgmail.com")
        user.invalid?
        expect(user.errors[:email]).to include("は不正な値です")
      end

    end

  end
end
