class BikesController < ApplicationController
  before_action :set_bike, only: [:show, :edit]
  def index
  end

  def show
    @booking = Booking.new
    @user = current_user
  end

  def index_owner
  end

  def new
  end

  def edit
  end

  def set_bike
    @bike = Bike.find(params[:id])
  end
end
