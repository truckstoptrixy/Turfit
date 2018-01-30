require 'test_helper'

class RelationshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get follow_model" do
    get relationships_follow_model_url
    assert_response :success
  end

  test "should get unfollow_model" do
    get relationships_unfollow_model_url
    assert_response :success
  end

end
