class AddAttributesToItems < ActiveRecord::Migration
  def change
    add_column :items, :required_level, :integer, :after => :name, :null => false
    add_column :items, :max_hp, :string, :after => :required_level, :default => nil
    add_column :items, :precisely, :string, :after => :max_hp, :default => nil
    add_column :items, :physic, :string, :after => :precisely, :default => nil
    add_column :items, :dodge, :string, :after => :physic, :default => nil
    add_column :items, :made_of, :string, :after => :dodge, :default => nil  
  end
end
