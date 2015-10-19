class HomeController < ApplicationController
  def index
    @payments = Payment.includes(:user, :month, :event).all
    @events = Event.all
    @months = Month.all
    @users = User.includes(:users_role, :roles).all
    @notifications = Notification.visible

    @current_month = Month.order(:firstDay).last
    @current_month_paid = 0.0
    @total_per_month = APP_CONFIG['cost_per_month']
    @cost_per_user = PaymentHelper.cost_per_person

    @total_balance = Event.sum(:amount)

    @grid = {}
    @payments.each do |payment|
      @grid[payment.user] ||= {}
      @grid[payment.user][payment.month] = payment
    end

    @events.where('date >= ?', @current_month.firstDay).
            where('date <= ?', @current_month.firstDay.end_of_month).
            each do |event|
      @current_month_paid += event.amount
    end

    @users.each { |user| @grid[user] ||= {} }
  end
end
