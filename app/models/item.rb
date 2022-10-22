class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre
  #間違ってるかも↓
  has_many :orderdetails
  has_many :cart_items

  validates :image, presence: true
  validates :item_name, presence: true
  validates :caption, presence: true
  validates :genre_id, presence: true
  validates :price, presence: true, numericality: {only_integer: true}

  def add_tax_price
    (self.price * 1.10).round
  end
end
