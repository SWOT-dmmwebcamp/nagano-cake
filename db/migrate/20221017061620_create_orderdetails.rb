class CreateOrderdetails < ActiveRecord::Migration[6.1]
  def change
    create_table :orderdetails do |t|
      t.integer :order_id,          null: false
      t.integer :item_id,           null: false
      t.integer :price_at_purchase, null: false
      t.integer :piece,             null: false
      t.integer :item_status,       null: false,  default: 0
      t.timestamps
    end
  end
end
