class Order < ApplicationRecord
  
  belongs_to :customer
  has_many :orderdetails
  accepts_nested_attributes_for :orderdetails
  
  
  enum pay_type: { credit_card: 0, transfer: 1 }
  enum order_status: { pay_wait: 0, pay_confirm: 1, making: 2, send_prepare: 3, sent: 4 }
  
  # 税込価格を計算するメソッド
  def add_tax_price
    (self.price * 1.10).round
  end
  
  # 小計を求めるメソッド
  def subtotal
      item.add_tax_price * piece
  end
  
end
