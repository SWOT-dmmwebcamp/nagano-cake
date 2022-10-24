class CartItem < ApplicationRecord
  
  belongs_to :item
  belongs_to :customer
  
  # 税込価格計算メソッド(item経由)
  def tax_price
      item.add_tax_price
  end
  
  # 小計を求めるメソッド
  def subtotal
      item.add_tax_price * piece
  end
  
end
