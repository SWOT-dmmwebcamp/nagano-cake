class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :delivery_zip
      t.string :delivery_address
      t.string :delivery_name
      t.intefer :delivery_fee
      t.integer :total_price
      t.integer :pay_type
      t.integer :order_status
      t.timestamps
    end
  end
end
