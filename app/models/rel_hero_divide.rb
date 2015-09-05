class RelHeroDivide < ActiveRecord::Base
  has_many :item_sets
  belongs_to :hero
  belongs_to :divide
end