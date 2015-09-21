class AddAttributesToHeros < ActiveRecord::Migration
  def change
    add_column :heroes, :position, :integer, :after => :hero_type, :null => false
    add_column :heroes, :base_star, :integer, :after => :description, :null => false
    add_column :heroes, :rcm_star, :integer, :after => :base_star, :null => false, :comment => "cap sao de nghi"
    add_column :heroes, :get_start_dif, :integer, :after => :rcm_star, :null => false, :comment => "do kho nhap mon"
    add_column :heroes, :grant_star_dif, :integer, :after => :get_start_dif, :null => false, :comment => "do kho len sao"
    add_column :heroes, :damage_point, :integer, :after => :grant_star_dif, :null => false, :comment => "sat thuong gay ra"
    add_column :heroes, :team_support_point, :integer, :after => :damage_point, :null => false, :comment => "ho tro nhom"
    add_column :heroes, :str_point, :integer, :after => :team_support_point, :null => false, :comment => "chi so suc manh"
    add_column :heroes, :int_point, :integer, :after => :str_point, :null => false, :comment => "chi so tri tue"
    add_column :heroes, :agi_point, :integer, :after => :int_point, :null => false, :comment => "chi so man tiep"
    add_column :heroes, :max_hp, :integer, :after => :agi_point, :null => false, :comment => "hp toi da"
    add_column :heroes, :physic_dmg, :integer, :after => :max_hp, :null => false, :comment => "luc cong vat ly"
    add_column :heroes, :magic_dmg, :integer, :after => :physic_dmg, :null => false, :comment => "cuong do phep"
    add_column :heroes, :magic_regist, :integer, :after => :magic_dmg, :null => false, :comment => "khang phep"
    add_column :heroes, :physic_shield, :integer, :after => :magic_regist, :null => false, :comment => "ho giap vat ly"
    add_column :heroes, :physic_chaos, :integer, :after => :physic_shield, :null => false, :comment => "bao kich vat ly"

    add_index :heroes, :hero_type
    add_index :heroes, :position
    add_index :heroes, :base_star
    add_index :heroes, :rcm_star
    add_index :heroes, :get_start_dif
    add_index :heroes, :grant_star_dif
  end
end
