class Hero < ActiveRecord::Base
  has_many :rel_hero_divides
  has_many :skills
end
