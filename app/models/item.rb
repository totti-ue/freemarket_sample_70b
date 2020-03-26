class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :delivery_charge
  delegate :charge, to: :delivery_charge
  belongs_to_active_hash :delivery_method
  belongs_to_active_hash :delivery_origin

  belongs_to :buyer, class_name: 'User', :foreign_key => 'buyer_id', optional: true
  belongs_to :seller, class_name: 'User', :foreign_key => 'seller_id'
  belongs_to :category # , foreign_key: 'category_id'
  has_many   :images, dependent: :destroy
  has_many   :likes, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true




  validates :title, presence: true
  validates :text, presence: true
  validates :price, presence: true, format: { with: /\d+/}
  validates :category_id, presence: true
  validates :status, presence: true
  validates :delivery_charge_id, presence: true
  validates :delivery_origin_id, presence: true
  validates :delivery_size, presence: true
  validates :delivery_method_id, presence: true
  validates :delivery_days, presence: true
  validates :images, presence: true


  def self.search(search)
    return Item.all unless search
    Item.where('title collate utf8_unicode_ci LIKE ?', "%#{search}%")
  end

end