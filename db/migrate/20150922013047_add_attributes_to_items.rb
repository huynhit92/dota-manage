class AddAttributesToItems < ActiveRecord::Migration
  def change
    add_column :items, :required_level, :integer, :after => :name, :null => false
    add_column :items, :description, :text, :after => :required_level, :default => nil
    add_column :items, :made_of, :text, :after => :description, :default => nil
    add_column :items, :can_create, :text, :after => :made_of, :default => nil
    add_column :items, :hero_use, :text, :after => :can_create, :default => nil
    add_column :items, :receive_method, :text, :after => :hero_use, :default => nil
    add_column :items, :quality, :integer, :after => :receive_method, :default => nil
    add_column :items, :type, :integer, :after => :quality, :default => nil
  end
end