require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  test "should get likes_toggle" do
    get likes_likes_toggle_url
    assert_response :success
  end

end
