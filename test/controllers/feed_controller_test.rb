require "test_helper"

class FeedControllerTest < ActionDispatch::IntegrationTest
  test "should get items" do
    get feed_items_url
    assert_response :success
  end
end
