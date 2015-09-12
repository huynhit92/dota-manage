#coding: utf-8
class User < ActiveRecord::Base
  extend Enumerize
  
  ADMIN = 1
  USER = 2

  enumerize :role, in: {:admin => ADMIN, :user => USER}, predicates: true
  devise :database_authenticatable
  has_many :posts

end
