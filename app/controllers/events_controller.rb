class EventsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authorize_user!
  before_filter :authenticate_admin!, except: [:index, :show]

  def index
    @events = Event.order("start asc")
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new event_params
    @event.save!
    render :show
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update!(event_params)
    render :show
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to root_path
  end


  private

  def event_params
    params.require(:event).permit(:location, :start, :end)
  end
end