require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get welcome_index_url
    assert_response :success
  end

  test "should get zillow" do
    get welcome_zillow_url
    assert_response :success
  end

  test "should get trulia" do
    get welcome_trulia_url
    assert_response :success
  end

end
