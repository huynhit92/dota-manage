#coding: utf-8
class User < ActiveRecord::Base

  devise :database_authenticatable
  has_many :posts
end
