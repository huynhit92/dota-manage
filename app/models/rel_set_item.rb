class RelSetItem < ActiveRecord::Base
  belongs_to :item_set
  belongs_to :item
end