class Month < ActiveRecord::Base
  validates_presence_of :name, :firstDay
  validates_uniqueness_of :name
  validates_uniqueness_of :firstDay
end
