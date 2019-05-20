require 'test_helper'

class BikesControllerTest < ActionDispatch::IntegrationTest
  test "should get :index" do
    get bikes_:index_url
    assert_response :success
  end

  test "should get :show" do
    get bikes_:show_url
    assert_response :success
  end

  test "should get :index_owner" do
    get bikes_:index_owner_url
    assert_response :success
  end

  test "should get :new" do
    get bikes_:new_url
    assert_response :success
  end

  test "should get :edit" do
    get bikes_:edit_url
    assert_response :success
  end

end
