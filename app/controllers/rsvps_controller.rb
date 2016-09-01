class RsvpsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authorize_user!

  def update
    event = Event.find(params[:id])
    rsvp = Rsvp.find_or_initialize_by(event_id: event.id, user_id: current_user.id)
    redirect_to(event, alert: "Invalid RSVP") and return unless Rsvp.rsvps.keys.include? params[:rsvp]
    rsvp.rsvp = params[:rsvp]
    if Event.last.start - Time.now < 24.hours
      rsvp.penalties.find_or_create_by(kind: Penalty.kinds[:last_minute_change])
    elsif Event.last.start - Time.now < 5.days
      rsvp.penalties.find_or_create_by(kind: Penalty.kinds[:late_rsvp])
    end
    if rsvp.save
      redirect_to(event, notice: "Successfully updated your RSVP!")
    else
      redirect_to(event, alert: "Failed to update your RSVP...")
    end
  end
end