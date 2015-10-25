class RelHeroGrownLevel < ActiveRecord::Base
  belongs_to :hero
  belongs_to :grown_level_master

  validates :hero_id, :grown_level_master_id, :str, :int, :agi, presence: true
  validates :str, :int, :agi, numericality: true
  validates :hero_id, :grown_level_master_id, numericality: { only_integer: true }
  validates_uniqueness_of :hero_id, :scope => [:grown_level_master_id]

end
