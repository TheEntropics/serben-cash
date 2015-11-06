class Month < ActiveRecord::Base
  validates_presence_of :firstDay
  validates_uniqueness_of :firstDay

  default_scope ->{ order(:firstDay) }

  has_many :payments

  def name
    I18n.l firstDay, format: :month
  end
end
