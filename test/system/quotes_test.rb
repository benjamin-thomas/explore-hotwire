require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase

  setup do
    @accountant = users(:accountant)
    login_as @accountant
    @top_quote = quotes(:third) # at the top of the page
  end

  test "Creating a new quote" do
    visit quotes_path
    assert_selector "h1", text: "Quotes"

    click_on "New quote"

    fill_in "Name", with: "Capybara quote"
    assert_selector "h1", text: "Quotes"
    click_on "Create quote"

    assert_selector "h1", text: "Quotes"
    assert_text "Capybara quote"
  end

  test "Showing a quote" do
    visit quotes_path
    click_link @top_quote.name

    assert_selector "h1", text: @top_quote.name
  end

  test "Updating a quote" do
    visit quotes_path
    assert_selector "h1", text: "Quotes"

    click_on "Edit", match: :first
    fill_in "Name", with: "Updated quote"
    assert_selector "h1", text: "Quotes"
    click_on "Update quote"

    assert_selector "h1", text: "Quotes"
    assert_text "Updated quote"
  end

  test "Destroying a quote" do
    visit quotes_path
    assert_text @top_quote.name

    click_on "Delete", match: :first
    assert_no_text @top_quote.name
  end

  test "create/delete reflects in realtime with turbo" do
    bg_quote_name = "Background quote!"

    visit quotes_path
    assert_no_text bg_quote_name

    quote = @accountant.company.quotes.create!(name: bg_quote_name)
    assert_text bg_quote_name

    quote.destroy!
    assert_no_text bg_quote_name
  end

  test "create/update reflects in realtime with turbo" do
    bg_quote_name = "Background quote!"
    bg_quote_name_changed = "CHANGED!"

    visit quotes_path
    assert_no_text bg_quote_name

    quote = @accountant.company.quotes.create!(name: bg_quote_name)
    assert_text bg_quote_name

    quote.update!(name: bg_quote_name_changed)
    assert_no_text bg_quote_name
    assert_text bg_quote_name_changed
  end

end
