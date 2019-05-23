class BikesController < ApplicationController
  before_action :set_bike, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show index_map]

  def index
    @no_container = true
    category = params[:category]
    if params[:query].present?

      if category == "All"
        sql_query = " \
          name @@ :query \
        "
        @bikes = Bike.where(sql_query, query: "%#{params[:query]}%")
      else
        sql_query = " \
          name @@ :query \
          AND category = :category
        "
        @bikes = Bike.where(sql_query, query: "%#{params[:query]}%", category: params[:category])
      end

      @message = "We found #{@bikes.count} bikes matching your search"
    else
      @bikes = Bike.all
    end
  end

  def index_map
    @bikes = Bike.where.not(latitude: nil, longitude: nil)

    @markers = @bikes.map do |bike|
      {
        lat: bike.latitude,
        lng: bike.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { bike: bike })
      }
    end
  end

  def show
    @booking = Booking.new
    authorize @bike
    @bike__markers = {
      lat: @bike.latitude,
      lng: @bike.longitude,

      infoWindow: render_to_string(partial: "infowindow", locals: { bike: @bike })
    }
    @owner = User.find(@bike.user_id)
  end

  def index_owner
    @current_user = current_user
    @bikes = policy_scope(Bike)
  end

  def new
    @new = true
    @bike = Bike.new

    authorize Bike
  end

  def create
    authorize Bike

    new_bike = Bike.new(params_permit)
    new_bike.rating = [1, 2, 3, 4, 5].sample
    new_bike.user = current_user

    new_bike.save!

    flash[:just_created] = "Created \"#{new_bike.name}\" Successfully!"

    # redirect_to my_bikes_path, just_created: "Created #{new_bike.name} successfully!"
    redirect_to my_bikes_path
  end

  def edit
    @edit = true
    authorize @bike
  end

  def update
    authorize @bike

    @bike.update(params_permit)

    flash[:just_updated] = "Updated \"#{@bike.name}\" Successfully!"

    redirect_to my_bikes_path
  end

  def destroy
    authorize @bike

    @bike.destroy

    @current_user = current_user
    @bikes = policy_scope(Bike)
    render :index_owner
  end

  private

  def set_bike
    @bike = Bike.find(params[:id])
  end

  def params_permit
    params.require(:bike).permit(:name, :category, :size, :photo, :price, :address)
  end
end
