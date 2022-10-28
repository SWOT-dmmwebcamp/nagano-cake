class CreateDestinations < ActiveRecord::Migration[6.1]
  def change
    create_table :destinations do |t|
      t.integer :customer_id,   null: false
      t.string  :zipcode,       null: false
      t.string  :address,      null: false
      t.string  :delivery_name, null: false
      t.timestamps
    end
  end
end
