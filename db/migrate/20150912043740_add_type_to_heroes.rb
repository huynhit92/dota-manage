class AddTypeToHeroes < ActiveRecord::Migration
  def change
    add_column :heroes, :hero_type, :integer, :after => :name, :null => false, :default => 1 
  end
end
