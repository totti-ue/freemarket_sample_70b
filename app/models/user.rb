class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :addresses
  has_many :cards
  has_many :items
  has_many :buyer_transactions, class_name: 'Transaction', :foreign_key => 'buyer_id'
  has_many :seller_transactions, class_name: 'Transaction', :foreign_key => 'seller_id'


  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: /[ぁ-んァ-ンａ-ｚＡ-Ｚ一-龥]+/ }
  validates :first_name, presence: true, format: { with: /[ぁ-んァ-ンａ-ｚＡ-Ｚ一-龥]+/ }
  validates :last_name_kana, presence: true, format: { with: /[ァ-ン]+/ }
  validates :first_name_kana, presence: true, format: { with: /[ァ-ン]+/ }
  validates :birthday, presence: true
end