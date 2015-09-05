class CreateRelSetItems < ActiveRecord::Migration
  def change
    create_table :rel_set_items do |t|
      t.integer :item_set_id, :null => false
      t.integer :item_id, :null => false
      t.integer :created_by         
      t.integer :updated_by
      
      t.timestamps null: false
    end
    add_index :rel_set_items, [:item_set_id, :item_id]
  end
end
