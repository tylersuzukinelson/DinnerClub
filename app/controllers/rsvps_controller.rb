class RsvpsController < ApplicationController
  before_filter :authenticate_user!

  def update
    event = Event.find(params[:id])
    rsvp = Rsvp.find_or_initialize_by(event_id: event.id, user_id: current_user.id)
    redirect_to(event, alert: "Invalid RSVP") and return unless Rsvp.rsvps.keys.include? params[:rsvp]
    rsvp.rsvp = params[:rsvp]
    if rsvp.save
      redirect_to(event, notice: "Successfully updated your RSVP!")
    else
      redirect_to(event, alert: "Failed to update your RSVP...")
    end
  end
end