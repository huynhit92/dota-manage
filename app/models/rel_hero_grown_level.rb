class RelHeroGrownLevel < ActiveRecord::Base
  belongs_to :hero
  belongs_to :grown_level_master
end