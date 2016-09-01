class RestaurantsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authorize_user!
  before_filter :authenticate_admin!

  def index
    @restaurants = Restaurant.order(title: :asc)
  end

  def create
    Restaurant.create restaurant_params
    redirect_to restaurants_path
  end

  def update
    Restaurant.find(params[:id]).update restaurant_params
    redirect_to restaurants_path
  end


  private

  def restaurant_params
    params.require(:restaurant).permit(:title, :address, :url)
  end
end