class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:landing]

  def landing
    @no_navbar = true
    @no_container = true
    if user_signed_in?
      redirect_to(bikes_path)
    end
  end
end
