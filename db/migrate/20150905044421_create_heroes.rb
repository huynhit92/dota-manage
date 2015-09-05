class CreateHeroes < ActiveRecord::Migration
  def change
    create_table :heroes do |t|
      t.string :name, :null => false, :default => ""
      t.text :description
      t.string :img_url, :null => false, :default => ""
      t.integer :created_by         
      t.integer :updated_by
      
      t.timestamps null: false
    end
  end
end
