class AddAttributesToItems2 < ActiveRecord::Migration
  def change
    add_column :items, :can_create, :integer, :after => :made_of, :default => nil
    add_column :items, :hero_use, :string, :after => :can_create, :default => nil
    add_column :items, :receive_method, :string, :after => :hero_use, :default => nil
  end
end
