require 'test_helper'

class UserCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_comments_index_url
    assert_response :success
  end

end
