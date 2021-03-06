class BookingsController < ApplicationController
  def index
    @current_user = current_user
    @bookings = Booking.where(user_id: @current_user).order("id")
  end

  def create
    @booking = Booking.new(review_params)
    @bike = Bike.find(params[:bike_id])
    @owner = User.find(@bike.user_id) # need this to pass it to the view when re-rendering render: 'bikes/show' below
    @booking.bike = @bike
    @booking.user = current_user
    authorize @booking
    if @booking.save
      @bike.dates[@booking.id] = [@booking.start_date, @booking.end_date]
      @bike.save
      redirect_to bike_path(@bike)
    else
      @bike__markers = {
        lat: @bike.latitude,
        lng: @bike.longitude,

        infoWindow: render_to_string(partial: "bikes/infowindow", locals: { bike: @bike })
      }
      render 'bikes/show'
    end
  end

  def confirm
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.confirmed = "confirmed"
    @booking.save
    redirect_to rentals_path
  end

  def cancel
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.confirmed = "cancelled"
    @booking.save
    if params["rentals"] == "true"
      redirect_to rentals_path
    else
      redirect_to bookings_path
    end
  end

  def rentals
    @bikes = Bike.where(user:current_user)
    @bookings = []
    @bikes.each do |bike|
      bike.bookings.each do |booking|
        @bookings << booking
      end
    end
    authorize Booking
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking

    @booking.destroy

    redirect_to rentals_path
  end

  private

  def review_params
    params.require(:booking).permit(:start_date, :end_date, :bike_id)
  end
end
