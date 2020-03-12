class Item < ApplicationRecord
  belongs_to :buyer, class_name: 'User', :foreign_key => 'buyer_id', optional: true
  belongs_to :seller, class_name: 'User', :foreign_key => 'seller_id'
  has_many   :images



  validates :title, presence: true
  validates :text, presence: true
  validates :price, presence: true, format: { with: /\d+/}


end
