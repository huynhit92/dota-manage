#coding: utf-8
class User < ActiveRecord::Base

  ADMIN = 1
  USER = 2

  extend Enumerize

  enumerize :role, in: {:admin => ADMIN, :user => USER}, predicates: true
  devise :database_authenticatable
  has_many :posts

end
