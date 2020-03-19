require 'rails_helper'

RSpec.describe Card, type: :model do

  describe "#create" do
    let!(:user) {create(:user)}

    context 'can save' do
      it "is valid with an user_id, customer_id, card_id" do
        expect(build(:card, user: user)).to be_valid
      end
    end

    context 'cannot save' do
      it "is invalid without an user_id" do
        card = build(:card)
        card.valid?
        expect(card.errors[:user]).to include("を入力してください")
      end

      it "is invalid without a customer_id" do
        card = build(:card, user: user, customer_id: nil)
        card.valid?
        expect(card.errors[:customer_id]).to include("を入力してください")
      end

      it "is invalid without a card_id" do
        card = build(:card, user: user, card_id: nil)
        card.valid?
        expect(card.errors[:card_id]).to include("を入力してください")
      end
    end

  end
end
