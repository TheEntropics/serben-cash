class User < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :username

  default_scope ->{ order('deleted ASC, banned ASC, name') }

  has_many :roles, through: :users_role
  has_many :users_role
  has_many :payments
end
