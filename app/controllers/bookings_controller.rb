class BookingsController < ApplicationController
  def index
  end

  def create
    @booking = Booking.new(review_params)
    @bike = Bike.find(params[:bike_id])
    @booking.bike = @bike
    @booking.user = current_user
    authorize @booking
    @booking.save!
    flash[:notice] = "Booking successful"

    redirect_to bike_path(@bike.id)
  end

  def rentals
  end

  def review_params
    params.require(:booking).permit(:start_date, :end_date, :bike_id)
  end
end
