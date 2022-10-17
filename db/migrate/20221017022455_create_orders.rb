class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :price_at_purchase
      t.integer :piece
      t.integer :production_status
      t.timestamps
    end
  end
end
