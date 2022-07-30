require "test_helper"

class QuoteTest < ActiveSupport::TestCase
  test "#by_created_at_desc" do
    assert_equal ["Third quote", "Second quote", "First quote"],
                 Quote.by_created_at_desc.pluck(:name)
  end
end
