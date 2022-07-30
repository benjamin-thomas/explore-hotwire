require "test_helper"

class QuotesControllerTest < ActionDispatch::IntegrationTest
  test "the index" do
    get quotes_path
    assert_response :success
    assert_select "h1", "Quotes"
  end
end
