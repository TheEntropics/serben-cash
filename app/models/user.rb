class User < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :username

  default_scope ->{ order('deleted ASC, banned ASC, name') }

  has_many :roles, through: :users_role
  has_many :users_role
  has_many :payments

  attr_accessor :additional_badges

  after_find :add_additional_badges

  def add_additional_badges
    @additional_badges = []
    add_gentleman_badge
  end

  protected
  def add_gentleman_badge
    has_gentleman_payment = payments.joins(:month).where('"firstDay" > ?', Date.today.end_of_month).count
    additional_badges.push('gentleman') if has_gentleman_payment > 0
  end
end
