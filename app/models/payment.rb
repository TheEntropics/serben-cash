class Payment < ActiveRecord::Base
  validates_presence_of :user_id, :month_id
  validates_uniqueness_of :user_id, scope: :month_id

  belongs_to :user
  belongs_to :month
  belongs_to :event
end
