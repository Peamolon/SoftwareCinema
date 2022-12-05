require "application_system_test_case"

class CalificationsTest < ApplicationSystemTestCase
  setup do
    @calification = califications(:one)
  end

  test "visiting the index" do
    visit califications_url
    assert_selector "h1", text: "Califications"
  end

  test "should create calification" do
    visit califications_url
    click_on "New calification"

    click_on "Create Calification"

    assert_text "Calification was successfully created"
    click_on "Back"
  end

  test "should update Calification" do
    visit calification_url(@calification)
    click_on "Edit this calification", match: :first

    click_on "Update Calification"

    assert_text "Calification was successfully updated"
    click_on "Back"
  end

  test "should destroy Calification" do
    visit calification_url(@calification)
    click_on "Destroy this calification", match: :first

    assert_text "Calification was successfully destroyed"
  end
end
