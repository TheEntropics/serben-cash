class Month < ActiveRecord::Base
  validates_presence_of :name, :firstDay
  validates_uniqueness_of :name
  validates_uniqueness_of :firstDay

  default_scope ->{ order(:firstDay) }

  has_many :payments

  def name
    firstDay && firstDay.strftime('%B %Y')
  end
end
