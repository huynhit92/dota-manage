class RelSetItem < ActiveRecord::Base
  belongs_to ItemSet
  belongs_to Item
end