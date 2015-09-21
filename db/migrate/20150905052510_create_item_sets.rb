class CreateItemSets < ActiveRecord::Migration
  def change
    create_table :item_sets do |t|
      t.integer :rel_hero_divide_id, :null => false
      t.integer :created_by         
      t.integer :updated_by
      t.integer :lock_version, :default => 0
      
      t.timestamps null: false
    end
    add_index :item_sets, :rel_hero_divide_id
  end
end
