require 'test_helper'

class UrlActionsControllerTest < ActionController::TestCase
  test "should get parse_url" do
    get :parse_url
    assert_response :success
  end

  test "should get sort_by_title" do
    get :sort_by_title
    assert_response :success
  end

  test "should get search_by_text" do
    get :search_by_text
    assert_response :success
  end

end
