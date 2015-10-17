class Event < ActiveRecord::Base
  validates_presence_of :date, :description, :amount

  default_scope ->{ order(:date) }

  has_many :payments
end
