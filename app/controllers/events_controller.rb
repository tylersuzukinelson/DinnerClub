class EventsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @events = Event.order("start asc")
  end
end