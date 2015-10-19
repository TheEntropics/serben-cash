class Credential < ActiveRecord::Base
  validates_presence_of :username, :password_digest
  validates_uniqueness_of :username

  has_secure_password
end
