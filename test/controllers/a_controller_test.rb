require 'test_helper'

class AControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get a_index_url
    assert_response :success
  end

end
