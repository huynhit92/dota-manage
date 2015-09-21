class CreateDivides < ActiveRecord::Migration
  def change
    create_table :divides do |t|
      t.string :name, :null => false
      t.integer :created_by         
      t.integer :updated_by
      t.integer :lock_version, :default => 0
      
      t.timestamps null: false
    end
  end
end
