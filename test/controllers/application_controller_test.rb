require 'test_helper'

class ApplicationControllerTest < ActionController::TestCase
  test "should get application" do
    get :application
    assert_response :success
  end

end
