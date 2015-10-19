class MonthsController < ApplicationController
  before_action :load_month, only: [:show, :update, :edit, :destroy]

  def index
    authorize :month, :index?

    @months = Month.all
    respond_to do |f|
      f.html
      f.json { render json: @months }
    end
  end
  def show
    authorize @month

    respond_to do |f|
      f.html
      f.json { render json: @months }
    end
  end

  def update
    authorize @month

    if @month.update(month_params)
      redirect_to @month
    else
      render :edit
    end
  end
  def edit
    authorize @month
  end

  def create
    @month = Month.new(month_params)
    authorize @month

    if @month.save
      redirect_to @month
    else
      render :new
    end
  end
  def new
    @month = Month.new
    authorize @month
  end

  def destroy
    authorize @month

    if @month.destroy
      redirect_to root_path
    else
      redirect_to @month
    end
  end

  private

  def load_month
    @month = Month.find params[:id]
  end

  def month_params
    params.require(:month).permit(:name, :firstDay)
  end
end
