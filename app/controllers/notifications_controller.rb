class NotificationsController < ApplicationController
  before_action :load_notification, only: [:show, :update, :edit, :destroy]

  def index
    @notifications = Notification.all
    respond_to do |f|
      f.html
      f.json { render json: @notifications }
    end
  end
  def show
    respond_to do |f|
      f.html
      f.json { render json: @notification }
    end
  end

  def update
    if @notification.update(notification_params)
      redirect_to @notification
    else
      render :edit
    end
  end
  def edit
  end

  def create
    @notification = Notification.new(notification_params)
    if @notification.save
      redirect_to @notification
    else
      render :new
    end
  end
  def new
    @notification = Notification.new
  end

  def destroy
    if @notification.destroy
      redirect_to root_path
    else
      redirect_to @notification
    end
  end

  private

  def load_notification
    @notification = Notification.find params[:id]
  end

  def notification_params
    params.require(:notification).permit(:text, :importance, :elapseDate)
  end
end
