require 'test_helper'

class ClubsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get my_clubs" do
    get :my_clubs
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

end
