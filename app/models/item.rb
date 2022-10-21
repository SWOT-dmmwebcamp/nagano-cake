class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre
  #間違ってるかも↓
  has_many :orderdetails
  has_many :cart_items

  validates :image, presence: true

  def add_tax_price
    (self.price * 1.10).round
  end
end
