require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get my" do
    get :my
    assert_response :success
  end

end
