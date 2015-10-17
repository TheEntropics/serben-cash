class UsersRole < ActiveRecord::Base
  validates_presence_of :user_id, :role_id
  validates_uniqueness_of :user_id, scope: :role_id

  belongs_to :user
  belongs_to :role
end
