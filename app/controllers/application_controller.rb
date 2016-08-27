class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate_admin!
    sign_out_and_redirect(current_user) unless current_user.try(:admin?)
  end

  def authorize_user!
    sign_out_and_redirect(current_user) unless current_user.try(:enabled?)
  end
end
