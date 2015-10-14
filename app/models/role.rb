class Role < ActiveRecord::Base
  validates_presence_of :name

  has_many :users, through: :users_role
  has_many :users_role
end
