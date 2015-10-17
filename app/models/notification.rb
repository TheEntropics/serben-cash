class Notification < ActiveRecord::Base
  validates_presence_of :text, :importance, :elapseDate

  scope :visible, -> { where('elapseDate >= ?', Date.today) }
end
