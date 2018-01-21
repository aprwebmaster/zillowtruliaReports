require 'test_helper'

class OnboardControllerTest < ActionDispatch::IntegrationTest
  test "should get initialize" do
    get onboard_initialize_url
    assert_response :success
  end

end
