require "test_helper"

class QuotesTest < ActionDispatch::IntegrationTest
  test "get the index" do
    get quotes_path
    assert_select "h1", "Quotes"
  end
end
