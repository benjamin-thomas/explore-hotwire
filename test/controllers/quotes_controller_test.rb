require "test_helper"

class QuotesControllerTest < ActionDispatch::IntegrationTest
  include Warden::Test::Helpers

  test "the index" do
    login_as users(:accountant)
    get quotes_path
    assert_response :success
    assert_select "h1", "Quotes"
  end
end
