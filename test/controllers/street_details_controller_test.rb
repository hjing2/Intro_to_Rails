require "test_helper"

class StreetDetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get street_details_show_url
    assert_response :success
  end
end
