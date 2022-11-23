require "test_helper"

class DraftsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get drafts_show_url
    assert_response :success
  end
end
