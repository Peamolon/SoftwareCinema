require "test_helper"

class CinemaPlaceControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cinema_place_index_url
    assert_response :success
  end

  test "should get show" do
    get cinema_place_show_url
    assert_response :success
  end

  test "should get new" do
    get cinema_place_new_url
    assert_response :success
  end
end
