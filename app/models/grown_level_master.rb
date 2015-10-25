class GrownLevelMaster < ActiveRecord::Base
  MASTERS = self.all.map{|i| {i.name =>  i.id}}.reduce({}, :merge)
end
