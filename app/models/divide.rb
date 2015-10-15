class Divide < ActiveRecord::Base
  MASTERS = self.all.map{|i| {i.name =>  i.id}}.reduce({}, :merge)
  has_many :rel_hero_divides
end
