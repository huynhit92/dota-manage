class Hero < ActiveRecord::Base
  extend Enumerize

  STRENGTH = 1
  AGILITY = 2
  INTELLIGENT = 3

  has_many :rel_hero_divides
  has_many :skills

  enumerize :hero_type, in: {:strength => STRENGTH, :agility => AGILITY, :intelligent => INTELLIGENT}, predicates: true

  def img_path
    return "heroes/" + self.img_url
  end
end
