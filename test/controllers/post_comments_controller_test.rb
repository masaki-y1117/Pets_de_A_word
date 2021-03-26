require 'test_helper'

class PostCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get post_comments_index_url
    assert_response :success
  end

end
