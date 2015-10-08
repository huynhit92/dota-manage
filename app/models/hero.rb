class Hero < ActiveRecord::Base
  include Rails.application.routes.url_helpers

  STRENGTH, AGILITY, INTELIGENT = 1, 2, 3
  FRONT, MIDDLE, BEHIND = 1, 2, 3

  TYPES_LIST = [["STRENGTH", STRENGTH], ["AGILITY", AGILITY], ["INTELIGENT", INTELIGENT]]
  IMG_PATH = "heroes/"
  TYPE_MASTERS = {
    "STRENGTH" => STRENGTH,
    "AGILITY" => AGILITY,
    "INTELIGENT" => INTELIGENT
  }
  IMAGES = Dir.glob("app/assets/images/heroes/*.png").map{|img| "assets/" + img.split('images/')[1]}

  has_many :rel_hero_divides
  has_many :skills
  has_many :rel_hero_grown_levels

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

  def attributes_json
    return {
      :img_path => self.img_path,
      :hero_position => self.hero_position
    }
  end

end
