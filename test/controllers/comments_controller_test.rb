require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  test "should get description:text" do
    get :description:text
    assert_response :success
  end

  test "should get user_id:integer" do
    get :user_id:integer
    assert_response :success
  end

  test "should get comment_id:integer" do
    get :comment_id:integer
    assert_response :success
  end

end
