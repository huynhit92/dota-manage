class AddNameToSkills < ActiveRecord::Migration
  def change
    add_column :skills, :name, :string, :after => :hero_id, :default => nil
  end
end
