require 'test_helper'

class BookmaksControllerTest < ActionDispatch::IntegrationTest
  test "should get bookmarks_toggle" do
    get bookmaks_bookmarks_toggle_url
    assert_response :success
  end

end
