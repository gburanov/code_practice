require 'test_helper'

class BookmarksControllerTest < ActionDispatch::IntegrationTest
  test "should get inxdex" do
    get bookmarks_inxdex_url
    assert_response :success
  end

end
