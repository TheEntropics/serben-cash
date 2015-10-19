class EventsController < ApplicationController
  before_action :load_event, only: [:show, :update, :edit, :destroy]

  def index
    authorize :event, :index?

    @events = Event.all
    respond_to do |f|
      f.html
      f.json { render json: @events }
    end
  end
  def show
    authorize @event

    respond_to do |f|
      f.html
      f.json { render json: @events }
    end
  end

  def update
    authorize @event

    if @event.update(event_params)
      redirect_to @event
    else
      render :edit
    end
  end
  def edit
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    authorize @event

    if @event.save
      redirect_to @event
    else
      render :new
    end
  end
  def new
    @event = Event.new
    authorize @event
  end

  def destroy
    authorize @event
    if @event.destroy
      redirect_to root_path
    else
      redirect_to @event
    end
  end

  private

  def load_event
    @event = Event.find params[:id]
  end

  def event_params
    params.require(:event).permit(:date, :description, :amount)
  end
end
