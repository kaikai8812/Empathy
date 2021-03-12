require 'test_helper'

class TroublesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get troubles_index_url
    assert_response :success
  end

  test "should get new" do
    get troubles_new_url
    assert_response :success
  end

  test "should get create" do
    get troubles_create_url
    assert_response :success
  end

  test "should get show" do
    get troubles_show_url
    assert_response :success
  end

  test "should get edit" do
    get troubles_edit_url
    assert_response :success
  end

  test "should get update" do
    get troubles_update_url
    assert_response :success
  end

  test "should get search" do
    get troubles_search_url
    assert_response :success
  end

  test "should get destroy" do
    get troubles_destroy_url
    assert_response :success
  end

end
