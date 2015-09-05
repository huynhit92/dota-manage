class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id, :null => false
      t.string :content, :null => false, :default => ""
      t.integer :created_by         
      t.integer :updated_by
      
      t.timestamps null: false
    end
    add_index :posts, :user_id
  end
end
