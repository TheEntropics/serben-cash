class HomeController < ApplicationController
  def index
    @payments = Payment.includes(:user, :month).all
    @events = Event.all
    @months = Month.all
    @notifications = Notification.visible

    @grid = {}
    @payments.each do |payment|
      @grid[payment.user] ||= {}
      @grid[payment.user][payment.month] = payment
    end
  end
end
