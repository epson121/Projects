require 'test_helper'

class AlarmClockControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get alarm" do
    get :alarm
    assert_response :success
  end

end
