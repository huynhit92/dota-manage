class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.integer :blog_id
      t.text :blog_pr_text
      t.string :lp_url
      t.string :image
      t.datetime :start_date
      t.datetime :end_date
      t.integer :created_by
      t.integer :updated_by
      t.integer :lock_version, :default => 0
      t.timestamps null: false
    end
  end
end
