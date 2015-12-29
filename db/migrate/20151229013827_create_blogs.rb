class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.integer :user_id, :null => false
      t.integer :blog_category_id, :null => false
      t.string :title, :null => false
      t.text :content, :null => false
      t.integer :created_by
      t.integer :updated_by
      t.integer :lock_version, :default => 0

      t.timestamps null: false
    end
    add_index :blogs, :user_id
    add_index :blogs, :blog_category_id
  end
end
