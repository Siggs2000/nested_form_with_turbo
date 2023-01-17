require "test_helper"

class TunesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get tunes_new_url
    assert_response :success
  end

  test "should get index" do
    get tunes_index_url
    assert_response :success
  end
end
