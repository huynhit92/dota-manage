class AddTypeToHeroes < ActiveRecord::Migration
  def change
    add_column :heroes, :type, :integer, :after => :name, :null => false, :default => 1
  end
end
