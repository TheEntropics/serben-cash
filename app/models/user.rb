class User < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :username

end
