class ItemSet < ActiveRecord::Base
  has_many :relset_items
  belongs_to :rel_hero_divide
end