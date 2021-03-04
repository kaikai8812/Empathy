require 'test_helper'

class PostCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get post_comments_index_url
    assert_response :success
  end

  test "should get create" do
    get post_comments_create_url
    assert_response :success
  end

  test "should get update" do
    get post_comments_update_url
    assert_response :success
  end

end
