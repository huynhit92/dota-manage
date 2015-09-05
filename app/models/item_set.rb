class ItemSet < ActiveRecord::Base
  has_many RelSetItem
  belongs_to RelHeroDivide
end