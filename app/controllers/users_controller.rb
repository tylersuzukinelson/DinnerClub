class UsersController < ApplicationController
  before_filter :authenticate_user!

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path, notice: "Successfully updated your profile!"
    else
      flash['alert'] = current_user.errors.full_messages.to_sentence
      render :edit
    end
  end


  private

  def user_params
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end