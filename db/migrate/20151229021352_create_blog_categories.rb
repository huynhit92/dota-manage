class CreateBlogCategories < ActiveRecord::Migration
  def change
    create_table :blog_categories do |t|
      t.string :name, :null => false
      t.integer :created_by
      t.integer :updated_by
      t.integer :lock_version, :default => 0

      t.timestamps null: false
    end
  end
end
