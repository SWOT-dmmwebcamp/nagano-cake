class CreateOrderdetails < ActiveRecord::Migration[6.1]
  def change
    create_table :orderdetails do |t|
      t.integer :order_id
      t.integer :item_id
      t.integer :price_at_purchase
      t.integer :piece
      t.integer :production_status
      t.timestamps
    end
  end
end
