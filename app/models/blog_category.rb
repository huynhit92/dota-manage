class BlogCategory < ActiveRecord::Base
  MASTERS = self.all.map{|i| {i.name =>  i.id}}.reduce({}, :merge)
  has_many :blogs
end
