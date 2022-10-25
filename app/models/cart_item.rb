class CartItem < ApplicationRecord

  has_one_attached :image
  belongs_to :item
  belongs_to :customer

  validates :piece, numericality: { greater_than_or_equal_to:1, less_than_or_equal_to:10 }

  # 税込価格計算メソッド(item経由)
  def tax_price
      item.add_tax_price
  end

  # 小計を求めるメソッド
  def subtotal
      item.add_tax_price * piece
  end

end
