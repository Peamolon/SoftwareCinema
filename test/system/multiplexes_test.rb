require "application_system_test_case"

class MultiplexesTest < ApplicationSystemTestCase
  setup do
    @multiplex = multiplexes(:one)
  end

  test "visiting the index" do
    visit multiplexes_url
    assert_selector "h1", text: "Multiplexes"
  end

  test "should create multiplex" do
    visit multiplexes_url
    click_on "New multiplex"

    click_on "Create Multiplex"

    assert_text "Multiplex was successfully created"
    click_on "Back"
  end

  test "should update Multiplex" do
    visit multiplex_url(@multiplex)
    click_on "Edit this multiplex", match: :first

    click_on "Update Multiplex"

    assert_text "Multiplex was successfully updated"
    click_on "Back"
  end

  test "should destroy Multiplex" do
    visit multiplex_url(@multiplex)
    click_on "Destroy this multiplex", match: :first

    assert_text "Multiplex was successfully destroyed"
  end
end
