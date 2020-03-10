class Address < ApplicationRecord
  belongs_to :user, optional: true

  validates :last_name, presence: true, format: { with: /[ぁ-んァ-ンａ-ｚＡ-Ｚ一-龥]+/ }
  validates :first_name, presence: true, format: { with: /[ぁ-んァ-ンａ-ｚＡ-Ｚ一-龥]+/ }
  validates :last_name_kana, presence: true, format: { with: /[ァ-ン]+/ }
  validates :first_name_kana, presence: true, format: { with: /[ァ-ン]+/ }
  validates :phone_number, presence: true, format: { with: /0\d{1,4}\-*\d{1,4}\-*\d{4}/ }
  validates :post_code, presence: true, format: { with: /\d{3}\-*\d{4}/ }
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :block, presence: true


end
