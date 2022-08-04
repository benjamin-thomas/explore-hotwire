require "application_system_test_case"

class BundlesTest < ApplicationSystemTestCase
  include ActionView::Helpers::NumberHelper # number_to_currency

  setup do
    login_as users(:accountant)

    @quote = quotes(:first)
    @bundle = bundles(:today)

    visit quote_path(@quote)
  end

  test "Create a bundle" do
    tomorrow = Date.today + 1

    assert_selector "h1", text: "First quote"

    click_on "New bundle"
    assert_selector "h1", text: "First quote"
    fill_in "Ship on", with: tomorrow
    click_on "Create bundle"
    assert_text "Bundle was successfully created."
    assert_text I18n.l(tomorrow, format: :long)
  end

  test "Update a bundle" do
    tomorrow = Date.today + 1
    assert_selector "h1", text: "First quote"

    within id: dom_id(@bundle) do
      click_on "Edit", match: :first
    end

    assert_selector "h1", text: "First quote"
    fill_in "Ship on", with: tomorrow
    click_on "Update bundle"
    assert_text "Bundle was successfully updated."
    assert_text I18n.l(tomorrow, format: :long)
  end

  test "Destroy a bundle" do
    assert_text I18n.l(Date.today, format: :long)

    accept_confirm do
      within id: dom_id(@bundle) do
        click_on "Delete", match: :first
      end
    end

    assert_no_text I18n.l(Date.today, format: :long)
    assert_text number_to_currency(@quote.total_price)
  end
end
