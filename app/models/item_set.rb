class ItemSet < ActiveRecord::Base
  has_many :rel_set_items
  belongs_to :rel_hero_divide
end
