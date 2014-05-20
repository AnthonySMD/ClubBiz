require 'test_helper'

class MainControllerTest < ActionController::TestCase
  test "should get landing" do
    get :landing
    assert_response :success
  end

  test "should get home" do
    get :home
    assert_response :success
  end

end
