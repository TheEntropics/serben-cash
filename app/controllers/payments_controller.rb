class PaymentsController < ApplicationController
  before_action :load_payment, only: [:show, :update, :edit, :destroy]

  def index
    authorize :payment, :index?

    @payments = Payment.all
    respond_to do |f|
      f.html
      f.json { render json: @payments }
    end
  end
  def show
    authorize @payment

    respond_to do |f|
      f.html
      f.json { render json: @payments }
    end
  end

  def update
    authorize @payment

    if @payment.update(payment_params)
      redirect_to @payment
    else
      render :edit
    end
  end
  def edit
    authorize @payment
    @users = User.all
    @months = Month.all
  end

  def create
    @payment = Payment.new(payment_params)
    authorize @payment

    date = Date.today
    date = @payment.month.firstDay if date < @payment.month.firstDay

    event = Event.new date: date, amount: PaymentHelper.cost_per_person,
                      description: "Payment of #{@payment.user.name} in #{@payment.month.name}"

    begin
      ActiveRecord::Base.transaction do
        event.save!
        @payment.event = event
        @payment.save!

        redirect_to @payment
      end
    rescue
      new
      render :new
    end
  end
  def new
    @payment = Payment.new
    @users = User.all
    @months = Month.all

    authorize @payment
  end

  def destroy
    authorize @payment

    event = @payment.event
    if event.payments.count == 1
      event.destroy!
    end

    if @payment.destroy
      redirect_to root_path
    else
      redirect_to @payment
    end
  end

  private

  def load_payment
    @payment = Payment.includes(:user, :month, :event).find(params[:id])
  end

  def payment_params
    params.require(:payment).permit(:user_id, :month_id)
  end
end
