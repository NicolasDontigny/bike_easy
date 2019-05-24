class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:landing]

  def landing
    @no_navbar = true
    @no_container = true
    if user_signed_in?
      redirect_to(bikes_path)
    end
  end

  def profile
    @user = User.find(params[:id])
  end

  def edit_profile_description
    @user = User.find(params[:id])
  end

  def update_profile
    @user = User.find(params[:id])
    @user.update(params_permit)

    flash[:just_updated] = " You successfully edited your description!"

    redirect_to(user_profile_path)
  end

  private

  def params_permit
    params.require(:user).permit(:profile_description)
  end
end
