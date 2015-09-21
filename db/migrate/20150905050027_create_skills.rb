class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.integer :hero_id, :null => false
      t.text :description, :null => false
      t.string :img_url, :null => false
      t.integer :created_by         
      t.integer :updated_by
      t.integer :lock_version, :default => 0
      
      t.timestamps null: false
    end
    add_index :skills, :hero_id
  end
end
