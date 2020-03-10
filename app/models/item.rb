class Item < ApplicationRecord
  belongs_to :user


  validates :title, presence: true
  validates :text, presence: true
  validates :price, presence: true, format: { with: /\d+/}


end
