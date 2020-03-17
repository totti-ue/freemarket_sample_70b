require 'rails_helper'

RSpec.describe Item, type: :model do


  describe "#create" do

    let!(:user) {create(:user)}
    let!(:category) {create(:category)}
    let!(:image) {build(:image)} 

    context 'can save' do
      it "is valid with title, text, category_id, brand_id, status, delivery_charge_id, delivery_origin_id, delivery_size, delivery_method_id, delivery_days, price" do
        item = build(:item, seller_id: user.id, images: [image], category_id: category.id) 
        expect(item).to be_valid
      end

      # priceが文字を含むとき
      it "is valid with Numbers with letters" do
        item = build(:item, price: "1000円", seller_id: user.id, images: [image], category_id: category.id)
        expect(item).to be_valid
      end
    end

    context 'cannot save' do
      # imageがない
      it "is invalid witout image" do
        item = build(:item, images: [], seller_id: user.id, category_id: category.id)
        item.valid?
        expect(item.errors[:images]).to include("を入力してください")
      end

      # tilteがない
      it "is invalid without title" do
        item = build(:item, title: nil, seller_id: user.id, images: [image], category_id: category.id)
        item.valid?
        expect(item.errors[:title]).to include("を入力してください")
      end

      # textがない
      it "is invalid without text" do
        item = build(:item, text: nil, seller_id: user.id, images: [image], category_id: category.id)
        item.valid?
        expect(item.errors[:text]).to include("を入力してください")
      end

      # category_idがない
      it "is invalid without category_id" do
        item = build(:item, category_id: nil, seller_id: user.id, images: [image])
        item.valid?
        expect(item.errors[:category_id]).to include("を入力してください")
      end

      # statusがない
      it "is invalid without status" do
        item = build(:item, status: nil, seller_id: user.id, images: [image], category_id: category.id)
        item.valid?
        expect(item.errors[:status]).to include("を入力してください")
      end

      # delivery_charge_idがない
      it "is invalid without delivery_charge_id" do
        item = build(:item, delivery_charge_id: nil, seller_id: user.id, images: [image], category_id: category.id)
        item.valid?
        expect(item.errors[:delivery_charge_id]).to include("を入力してください")
      end

      # delivery_origin_idがない
      it "is invalid without delivery_origin_id" do
        item = build(:item, delivery_origin_id: nil, seller_id: user.id, images: [image], category_id: category.id)
        item.valid?
        expect(item.errors[:delivery_origin_id]).to include("を入力してください")
      end

      # delivery_sizeがない
      it "is invalid without delivery_size" do
        item = build(:item, delivery_size: nil, seller_id: user.id, images: [image], category_id: category.id)
        item.valid?
        expect(item.errors[:delivery_size]).to include("を入力してください")
      end

      # delivery_method_idがない
      it "is invalid without delivery_method_id" do
        item = build(:item, delivery_method_id: nil, seller_id: user.id, images: [image], category_id: category.id)
        item.valid?
        expect(item.errors[:delivery_method_id]).to include("を入力してください")
      end

      # delivery_daysがない
      it "is invalid without delivery_days" do
        item = build(:item, delivery_days: nil, seller_id: user.id, images: [image], category_id: category.id)
        item.valid?
        expect(item.errors[:delivery_days]).to include("を入力してください")
      end

      # priceがない
      it "is invalid without price" do
        item = build(:item, price: nil, seller_id: user.id, images: [image], category_id: category.id)
        item.valid?
        expect(item.errors[:price]).to include("を入力してください")
      end
    end
  end

end
