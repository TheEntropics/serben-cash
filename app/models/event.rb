class Event < ActiveRecord::Base
  validates_presence_of :date, :description, :amount

  default_scope ->{ order('date DESC') }

  has_many :payments

  def locale_description
    if match = /Payment of (.*) in (.*)/.match(attribute(:description))
      user = match[1]
      month = Date.parse(match[2])
      return I18n.translate(:balance_payment, user: user, month: I18n.localize(month, format: :month))
    end
    attribute(:description)
  end
end
