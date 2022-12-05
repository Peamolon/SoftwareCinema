require "test_helper"

class MultiplexesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @multiplex = multiplexes(:one)
  end

  test "should get index" do
    get multiplexes_url
    assert_response :success
  end

  test "should get new" do
    get new_multiplex_url
    assert_response :success
  end

  test "should create multiplex" do
    assert_difference("Multiplex.count") do
      post multiplexes_url, params: { multiplex: {  } }
    end

    assert_redirected_to multiplex_url(Multiplex.last)
  end

  test "should show multiplex" do
    get multiplex_url(@multiplex)
    assert_response :success
  end

  test "should get edit" do
    get edit_multiplex_url(@multiplex)
    assert_response :success
  end

  test "should update multiplex" do
    patch multiplex_url(@multiplex), params: { multiplex: {  } }
    assert_redirected_to multiplex_url(@multiplex)
  end

  test "should destroy multiplex" do
    assert_difference("Multiplex.count", -1) do
      delete multiplex_url(@multiplex)
    end

    assert_redirected_to multiplexes_url
  end
end
