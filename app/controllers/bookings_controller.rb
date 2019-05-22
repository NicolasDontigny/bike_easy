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

    @bike.dates.each_value do |value|
      if @bike.dates.indlude?(value)
        @bike.dates[@booking.id] = [@booking.start_date, @booking.end_date]
        @bike.save!
        @booking.save!
        authorize @booking
      end
    end

    redirect_to bike_path(@bike.id)
  end

  def rentals
  end

  def review_params
    params.require(:booking).permit(:start_date, :end_date, :bike_id)
  end
end
