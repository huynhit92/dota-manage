class CreateRelHeroDivides < ActiveRecord::Migration
  def change
    create_table :rel_hero_divides do |t|
      t.integer :hero_id, :null => false
      t.integer :divide_id, :null => false
      t.integer :created_by         
      t.integer :updated_by
      
      t.timestamps null: false
    end
    add_index :rel_hero_divides, [:hero_id, :divide_id]
  end
end
