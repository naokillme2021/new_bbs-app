require 'test_helper'

class PostThredsControllerTest < ActionDispatch::IntegrationTest
  test "should get post" do
    get post_threds_post_url
    assert_response :success
  end

end
