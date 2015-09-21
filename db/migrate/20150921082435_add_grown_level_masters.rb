class AddGrownLevelMasters < ActiveRecord::Migration
  def change
    create_table :grown_level_masters do |t|
      t.string :name
      t.integer :created_by         
      t.integer :updated_by
      t.integer :lock_version, :default => 0
      
      t.timestamps null: false
    end
  end
end
