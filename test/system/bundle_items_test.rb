require "application_system_test_case"

class BundleItemsTest < ApplicationSystemTestCase
  include ApplicationHelper::Dom

  setup do
    login_as users(:accountant)
    @quote = quotes(:first)
    @room_today = bundle_items(:room_today)

    visit quote_path(@quote)
  end

  test "create a bundle item" do
    assert_on_quote_page
    assert_no_text "$5.67"

    click_on "Add item", match: :first
    assert_on_quote_page

    fill_in "Name", with: "Animation"
    fill_in "Quantity", with: 1
    fill_in "Price", with: 5.67
    click_on "Create item"
    assert_on_quote_page

    assert_text "Animation"
    assert_text "$5.67"
  end

  test "update a bundle item" do
    assert_on_quote_page
    assert_text "Meeting room"
    assert_no_text "Meeting office"
    assert_no_text "$888.88"

    within("##{dom_id_nested(@room_today.bundle, @room_today)}") do
      click_on "Edit"
    end
    assert_on_quote_page
    fill_in "Name", with: "Meeting office"
    fill_in "Quantity", with: 1
    fill_in "Price", with: 888.88
    click_on "Update item"
    assert_on_quote_page

    assert_text "$888.88"
    assert_text "Meeting office"
    assert_no_text "Meeting room"
  end

  test "destroy a bundle item" do
    assert_on_quote_page
    assert_text "Meeting room"

    within("##{dom_id_nested(@room_today.bundle, @room_today)}") do
      click_on "Delete"
    end
    assert_on_quote_page
    assert_no_text "Meeting room"
  end

  private

    def assert_on_quote_page
      assert_selector "h1", text: "First quote"
    end

end
