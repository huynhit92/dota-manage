class RelHeroDivide < ActiveRecord::Base
  has_many ItemSet
  belongs_to Hero
  belongs_to Divide
end