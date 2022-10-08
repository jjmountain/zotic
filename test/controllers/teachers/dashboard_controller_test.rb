require "test_helper"

class Teachers::DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get teachers_dashboard_home_url
    assert_response :success
  end
end
