#coding: utf-8
class User < ActiveRecord::Base
  ADMIN = 1
  USER = 2

  devise :database_authenticatable
  has_many :posts

  def admin?
    return self.role == ADMIN
  end

end
