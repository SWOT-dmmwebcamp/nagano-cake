class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :item_name
      t.text :caption
      t.integer :price
      t.boolean :sales_status

      t.timestamps
    end
  end
end
