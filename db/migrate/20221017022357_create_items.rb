class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :genre_id,      null: false
      t.string  :item_name,     null: false
      t.text    :caption,       null: false
      t.integer :price,         null: false
      t.boolean :sales_status,  null: false,  default: true
      t.timestamps
    end
  end
end
