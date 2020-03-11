require 'rails_helper'

RSpec.describe Address, type: :model do

  describe "new" do

    context 'can save' do
      before do
        @user = create(:user)
      end

      it "is valid with a last_name, first_name, last_name_kana, first_name_kana, post_code, prefecture, city, block" do
        expect(build(:address, phone_number: nil, building: nil,  user: @user)).to be_valid
      end

    end

    
    # 保存できない時
    context 'cannot save' do 

      # last_nameがないとダメ
      it "last_nameがないと保存できない" do
        address = build(:address, last_name: nil, user: @user)
        address.valid?
        expect(address.errors[:last_name]).to include("を入力してください")
      end

      # first_nameがないとダメ
      it "first_nameがないと保存できない" do
        address = build(:address, first_name: nil, user: @user)
        address.valid?
        expect(address.errors[:first_name]).to include("を入力してください")
      end

      # last_name_kanaがないとダメ
      it "last_name_kanaがないと保存できない" do
        address = build(:address, last_name_kana: nil, user: @user)
        address.valid?
        expect(address.errors[:last_name_kana]).to include("を入力してください")
      end

      # first_name_kanaがないとダメ
      it "first_name_kanaがないと保存できない" do
        address = build(:address, first_name_kana: nil, user: @user)
        address.valid?
        expect(address.errors[:first_name_kana]).to include("を入力してください")
      end

      # post_codeがないとダメ
      it "post_codeがないと保存できない" do
        address = build(:address, post_code: nil, user: @user)
        address.valid?
        expect(address.errors[:post_code]).to include("を入力してください")
      end

      # prefectureがないとダメ
      it "prefectureがないと保存できない" do
        address = build(:address, prefecture: nil, user: @user)
        address.valid?
        expect(address.errors[:prefecture]).to include("を入力してください")
      end

      # cityがないとダメ
      it "cityがないと保存できない" do
        address = build(:address, city: nil, user: @user)
        address.valid?
        expect(address.errors[:city]).to include("を入力してください")
      end

      # blockがないとダメ
      it "blockがないと保存できない" do
        address = build(:address, block: nil, user: @user)
        address.valid?
        expect(address.errors[:block]).to include("を入力してください")
      end

      it "last_nameは全角の文字じゃないと保存できない" do
        address = build(:address, last_name: "1234", user: @user)
        address.valid?
        expect(address.errors[:last_name]).to include("は不正な値です")
      end

      it "first_nameは全角の文字じゃないと保存できない" do
        address = build(:address, first_name: "1234", user: @user)
        address.valid?
        expect(address.errors[:first_name]).to include("は不正な値です")
      end

      it "last_name_kanaは全角のカタカナじゃないと保存できない" do
        address = build(:address, last_name_kana: "ひらがな", user: @user)
        address.valid?
        expect(address.errors[:last_name_kana]).to include("は不正な値です")
      end

      it "first_name_kanaは全角のカタカナじゃないと保存できない" do
        address = build(:address, first_name_kana: "かたかな", user: @user)
        address.valid?
        expect(address.errors[:first_name_kana]).to include("は不正な値です")
      end

      it "post_codeはハイフンの前3桁、後ろ4桁じゃないと保存できない" do
        address = build(:address, post_code: "2224-44", user: @user)
        address.valid?
        expect(address.errors[:post_code]).to include("は不正な値です")
      end

      it "post_codeは7桁じゃないと保存できない" do
        address = build(:address, post_code: "22245144", user: @user)
        address.valid?
        expect(address.errors[:post_code]).to include("は不正な値です")
      end

    end

  end
end
