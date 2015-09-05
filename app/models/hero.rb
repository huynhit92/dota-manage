class Hero < ActiveRecord::Base
  has_many RelHeroDivide
  has_many Skill
end
