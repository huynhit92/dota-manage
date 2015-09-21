class AddRelHeroGrownLevels < ActiveRecord::Migration
  def change
    create_table :rel_hero_grown_levels do |t|
      t.integer :hero_id, :null => false
      t.integer :grown_level_master_id, :null => false
      t.float :str, :null => false
      t.float :int, :null => false
      t.float :agi, :null => false
      t.integer :created_by         
      t.integer :updated_by
      t.integer :lock_version, :default => 0
      
      t.timestamps null: false
    end
    add_index :rel_hero_grown_levels, :hero_id
    add_index :rel_hero_grown_levels, [:hero_id, :grown_level_master_id], :unique => true
  end
end
