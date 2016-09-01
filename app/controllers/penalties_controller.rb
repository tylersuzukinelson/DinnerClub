class PenaltiesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authorize_user!
  before_filter :authenticate_admin!

  def index
    @penalties = Penalty.order(updated_at: :desc)
    @penalty = Penalty.new
  end

  def create
    rsvp = Rsvp.where(event_id: penalty_params[:event], user_id: penalty_params[:user]).first
    if rsvp.nil?
      redirect_to penalties_path, alert: "That user did not RSVP for that event!"
      return
    end
    @penalty = Penalty.find_or_create_by rsvp: rsvp, kind: Penalty.kinds[penalty_params[:kind]]
    redirect_to penalties_path
  end

  def destroy
    @penalty = Penalty.find(params[:id])
    @penalty.destroy
    redirect_to penalties_path
  end


  private

  def penalty_params
    params.require(:penalty).permit(:event, :user, :kind)
  end
end