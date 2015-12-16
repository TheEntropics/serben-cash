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

  def missing_months(target_month = Date.today.beginning_of_month)
    past = payments.joins(:month).where('"firstDay" <= ?', Date.today.beginning_of_month).order('"firstDay"')
    return [] if past.size == 0
    ids = Month.where('"firstDay" >= ?', past.first.month.firstDay).where('"firstDay" <= ?', target_month).pluck(:id) - past.pluck(:month_id)
    Month.find(ids)
  end

  protected
  def add_gentleman_badge
    has_gentleman_payment = payments.joins(:month).where('"firstDay" > ?', Date.today.end_of_month).count
    @additional_badges.push([I18n.t('badges.gentleman'), 'badge-pro']) if has_gentleman_payment > 0
  end

  def add_rotten_badge
    if !deleted && !banned && missing_months.size != 0
      @additional_badges.push([I18n.t('badges.rotten'), 'label-danger'])
    end
  end
end
