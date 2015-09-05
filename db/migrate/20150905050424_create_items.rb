class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name, :null => false
      t.text :name, :null => false
      t.string :img_url, :null => false
      t.integer :created_by         
      t.integer :updated_by
      
      t.timestamps null: false
    end
  end
end
