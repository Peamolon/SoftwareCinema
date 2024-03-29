require "application_system_test_case"

class ProductOrdersTest < ApplicationSystemTestCase
  setup do
    @product_order = product_orders(:one)
  end

  test "visiting the index" do
    visit product_orders_url
    assert_selector "h1", text: "Product orders"
  end

  test "should create product order" do
    visit product_orders_url
    click_on "New product order"

    click_on "Create Product order"

    assert_text "Product order was successfully created"
    click_on "Back"
  end

  test "should update Product order" do
    visit product_order_url(@product_order)
    click_on "Edit this product order", match: :first

    click_on "Update Product order"

    assert_text "Product order was successfully updated"
    click_on "Back"
  end

  test "should destroy Product order" do
    visit product_order_url(@product_order)
    click_on "Destroy this product order", match: :first

    assert_text "Product order was successfully destroyed"
  end
end
