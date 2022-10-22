class CartItem < ApplicationRecord
  #間違えている可能性あり
  belongs_to :items
  belongs_to :customers
end
