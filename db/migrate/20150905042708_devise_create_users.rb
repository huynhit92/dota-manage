class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name, :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""
      t.integer :role, :null => false, :default => 2
      t.integer :created_by         
      t.integer :updated_by
      t.integer :lock_version, :default => 0
      
      t.timestamps null: false
    end
  end
end
