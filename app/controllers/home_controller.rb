class HomeController < ApplicationController
  def index
    @payments = Payment.includes(:user, :month).all
    @events = Event.all
    @months = Month.all
    @users = User.all.includes(:roles)
    @notifications = Notification.visible

    @current_month = Month.order(:firstDay).last
    @current_month_paid = 0
    @total_per_month = APP_CONFIG['cost_per_month']

    @grid = {}
    @payments.each do |payment|
      @grid[payment.user] ||= {}
      @grid[payment.user][payment.month] = payment

      if payment.month == @current_month
        @current_month_paid += 1
      end
    end

    @users.each { |user| @grid[user] ||= {} }
  end
end
