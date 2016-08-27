class AdminController < ApplicationController
  before_filter :authorize_user!
  before_filter :authenticate_admin!

  def index
  end

  def users
    @users = User.all
  end

  def toggle_user
    user = User.find(params[:id])
    user.enabled = !user.enabled?
    user.save!
    redirect_to users_admin_index_path
  end
end