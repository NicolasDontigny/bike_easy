class ReviewsController < ApplicationController
  before_action :set_bike, only: %i[create]

  def create
    @review = Review.new(params_permit)

    @review.bike = @bike

    @review.user = current_user
    @review.date = Date.today
    authorize @review

    if @review.save
      redirect_to bike_path(@bike)
    else
      render 'bikes/show'
    end
  end

  private

  def set_bike
    @bike = Bike.find(params[:bike_id])
  end

  def params_permit
    params.require(:review).permit(:content, :rating)
  end
end
