class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id, :null => false
      t.string :content, :null => false, :default => ""
    end
    add_index :posts, :user_id
  end
end
