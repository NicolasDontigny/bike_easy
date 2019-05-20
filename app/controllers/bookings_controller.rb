class BookingsController < ApplicationController
  def index
  end

  def create
    @booking = Booking.new(review_params)
    @bike = Bike.find(params[:bike_id])
    @user = User.find(params[:user_id])
    @booking.bike = @bike
    @booking.user = @buser
    redirect_to bike_path(@bike.id)
  end

  def rentals
  end

  def review_params
    params.require(:booking).permit(:start_date, :end_date, :bike_id, :user_id)
  end
end
