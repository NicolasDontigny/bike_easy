require 'test_helper'

class BookingsControllerTest < ActionDispatch::IntegrationTest
  test "should get :index" do
    get bookings_:index_url
    assert_response :success
  end

  test "should get :rentals" do
    get bookings_:rentals_url
    assert_response :success
  end

end
