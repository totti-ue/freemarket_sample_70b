class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :delivery_charge
  delegate :charge, to: :delivery_charge

  belongs_to :buyer, class_name: 'User', :foreign_key => 'buyer_id', optional: true
  belongs_to :seller, class_name: 'User', :foreign_key => 'seller_id'
  has_many   :images



  validates :title, presence: true
  validates :text, presence: true
  validates :price, presence: true, format: { with: /\d+/}


end
