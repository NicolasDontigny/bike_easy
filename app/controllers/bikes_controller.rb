class BikesController < ApplicationController
  before_action :set_bike, only: [:show, :edit]
  def index
  end

  def show
    @booking = Booking.new
    @user = current_user
  end

  def index_owner
    @current_user = current_user
    @bikes = Bike.all.where(user: @current_user)
  end

  def new
  end

  def edit
  end

  def set_bike
    @bike = Bike.find(params[:id])
  end
end
