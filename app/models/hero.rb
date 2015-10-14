class Hero < ActiveRecord::Base
  include Rails.application.routes.url_helpers

  STRENGTH, AGILITY, INTELIGENT = 1, 2, 3
  FRONT, MIDDLE, BEHIND = 1, 2, 3

  TYPES_LIST = [["STRENGTH", STRENGTH], ["AGILITY", AGILITY], ["INTELIGENT", INTELIGENT]]
  IMG_PATH = "heroes/"
  TYPE_MASTERS = {"STRENGTH" => STRENGTH, "AGILITY" => AGILITY, "INTELIGENT" => INTELIGENT}
  POSITION_MASTERS = {"前" => 1, "中" => 2, "後" => 3}
  IMAGES = Dir.glob("app/assets/images/heroes/*.png").map{|img| "assets/" + img.split('images/')[1]}

  has_many :rel_hero_divides
  has_many :skills
  has_many :rel_hero_grown_levels

  validates :name, :hero_type, :position, :description, :base_star, :rcm_star, :get_start_dif, :damage_point,
            :team_support_point, :str_point, :int_point, :agi_point, :max_hp, :physic_dmg, :magic_dmg, :magic_regist,
            :physic_shield, :physic_chaos, :img_url, presence: true

  validates :hero_type, :position, :base_star, :rcm_star, :get_start_dif, :damage_point, :team_support_point, :str_point,
            :int_point, :agi_point, :max_hp, :physic_dmg, :magic_dmg, :magic_regist,
            :physic_shield, :physic_chaos, numericality: { only_integer: true }

  validates :name, uniqueness: true
  validates :img_url, uniqueness: true

  scope :list_strength , -> { where(:hero_type => STRENGTH) }
  scope :list_agility , -> { where(:hero_type => AGILITY) }
  scope :list_inteligent , -> { where(:hero_type => INTELIGENT) }

  def img_path
    return  "assets/" + IMG_PATH + self.img_url
  end

  def hero_position
    case position
    when FRONT
      return "前"
    when MIDDLE
      return "中"
    when BEHIND
      return "後"
    end
  end

  def gen_grown_levels_json
    data = self.rel_hero_grown_levels.map{|i|
      {
        :id => i.grown_level_master.id,
        :name => i.grown_level_master.name,
        :str => i.str,
        :int => i.int,
        :agi => i.agi
      }
    }
    return data.to_json
  end

  def methods_json
    return {
      :img_path => self.img_path,
      :hero_position => self.hero_position
    }
  end

  def self.compact_json
    return {
      :include => {
        :rel_hero_grown_levels => {
          :include => :grown_level_master
        }
     },
     :methods => :methods_json
   }
  end

end
