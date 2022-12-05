require "test_helper"

class CalificationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @calification = califications(:one)
  end

  test "should get index" do
    get califications_url
    assert_response :success
  end

  test "should get new" do
    get new_calification_url
    assert_response :success
  end

  test "should create calification" do
    assert_difference("Calification.count") do
      post califications_url, params: { calification: {  } }
    end

    assert_redirected_to calification_url(Calification.last)
  end

  test "should show calification" do
    get calification_url(@calification)
    assert_response :success
  end

  test "should get edit" do
    get edit_calification_url(@calification)
    assert_response :success
  end

  test "should update calification" do
    patch calification_url(@calification), params: { calification: {  } }
    assert_redirected_to calification_url(@calification)
  end

  test "should destroy calification" do
    assert_difference("Calification.count", -1) do
      delete calification_url(@calification)
    end

    assert_redirected_to califications_url
  end
end
