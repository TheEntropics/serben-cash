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
  end

  def create
    @payment = Payment.new(payment_params)
    authorize @payment

    if @payment.save
      # TODO: create the corresponding event
      redirect_to @payment
    else
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

    if @payment.destroy
      redirect_to root_path
    else
      redirect_to @payment
    end
  end

  private

  def load_payment
    @payment = Payment.includes(:user, :month, :event).find(params[:id])
    @users = User.all
    @months = Month.all
  end

  def payment_params
    params.require(:payment).permit(:user_id, :month_id)
  end
end
