class Event < ActiveRecord::Base
  validates_presence_of :date, :description, :amount
end
