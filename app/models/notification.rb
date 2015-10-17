class Notification < ActiveRecord::Base
  validates_presence_of :text, :importance, :elapseDate
end
