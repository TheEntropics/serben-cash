class User < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :username

  has_many :roles, through: :users_role
  has_many :users_role
  has_many :payments
end
