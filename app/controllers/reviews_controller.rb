class ReviewsController < ApplicationController
  before_action :set_bike, only: %i[create]

  def create
    @review = Review.new(params_permit)

    @review.bike = @bike

    @review.user = current_user
    @review.date = Date.today
    authorize @review

    if @review.save
      respond_to do |format|
        format.html { redirect_to bike_path(@bike) }
        format.js # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'bikes/show' }
        format.js # <-- idem
      end
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
