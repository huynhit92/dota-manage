class Hero < ActiveRecord::Base
  extend Enumerize
  include Rails.application.routes.url_helpers

  STRENGTH = 1
  AGILITY = 2
  INTELIGENT = 3
  TYPES_LIST = [["STRENGTH", STRENGTH], ["AGILITY", AGILITY], ["INTELIGENT", INTELIGENT]]
  IMG_PATH = "heroes/"

  has_many :rel_hero_divides
  has_many :skills
  has_many :rel_hero_grown_levels

  enumerize :hero_type, in: {:strength => STRENGTH, :agility => AGILITY, :intelligent => INTELIGENT}, predicates: true

  scope :list_strength , -> { where(:hero_type => STRENGTH) }
  scope :list_agility , -> { where(:hero_type => AGILITY) }
  scope :list_inteligent , -> { where(:hero_type => INTELIGENT) }

  def img_path
    return IMG_PATH + self.img_url
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
end
