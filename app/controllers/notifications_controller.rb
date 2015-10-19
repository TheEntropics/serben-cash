class NotificationsController < ApplicationController
  before_action :load_notification, only: [:show, :update, :edit, :destroy]

  def index
    authorize :notification, :index?

    @notifications = Notification.all
    respond_to do |f|
      f.html
      f.json { render json: @notifications }
    end
  end
  def show
    authorize @notification

    respond_to do |f|
      f.html
      f.json { render json: @notification }
    end
  end

  def update
    authorize @notification

    if @notification.update(notification_params)
      redirect_to @notification
    else
      render :edit
    end
  end
  def edit
    authorize @notification
  end

  def create
    @notification = Notification.new(notification_params)
    authorize @notification

    if @notification.save
      redirect_to @notification
    else
      render :new
    end
  end
  def new
    @notification = Notification.new
    authorize @notification
  end

  def destroy
    authorize @notification

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
