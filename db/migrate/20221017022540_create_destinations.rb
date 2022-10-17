class CreateDestinations < ActiveRecord::Migration[6.1]
  def change
    create_table :destinations do |t|
      t.integer     :customer_id
      t.string      :zipcode
      t.string      :addresss
      t.string      :delivery_name
      t.timestamps
    end
  end
end
