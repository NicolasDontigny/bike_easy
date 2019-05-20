class BikesController < ApplicationController
  def index
  end

  def show
  end

  def index_owner
    @current_user = current_user
    @bikes = Bike.all.where(user_id: @current_user.id)
    raise
  end

  def new
  end

  def edit
  end
end
