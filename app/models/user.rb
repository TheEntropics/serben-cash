class User < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :username

  default_scope ->{ order('deleted ASC, banned ASC, name') }

  has_many :roles, through: :users_role
  has_many :users_role
  has_many :payments

  def additional_badges
    return @additional_badges if @additional_badges
    @additional_badges = []
    add_gentleman_badge
    add_rotten_badge
    @additional_badges
  end

  protected
  def add_gentleman_badge
    has_gentleman_payment = payments.joins(:month).where('"firstDay" > ?', Date.today.end_of_month).count
    @additional_badges.push([I18n.t('badges.gentleman'), 'badge-pro']) if has_gentleman_payment > 0
  end

  def add_rotten_badge
    has_missing_payment = payments.joins(:month).where('"firstDay" = ?', Date.today.beginning_of_month).count
    @additional_badges.push([I18n.t('badges.rotten'), 'label-danger']) if has_missing_payment == 0
  end
end
