class BookingsController < ApplicationController
  def index
    @current_user = current_user
    @bookings = Booking.all
  end

  def create
    @booking = Booking.new(review_params)
    @bike = Bike.find(params[:bike_id])
    @booking.bike = @bike
    @booking.user = current_user
    authorize @booking
    @booking.save!

    redirect_to bike_path(@bike.id)
  end

  def confirm
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.confirmed = "confirmed"
    @booking.save

    redirect_to bookings_path
  end

  def cancel
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.confirmed = "cancelled"
    @booking.save

    redirect_to bookings_path
  end

  def rentals
  end

  def review_params
    params.require(:booking).permit(:start_date, :end_date, :bike_id)
  end
end
