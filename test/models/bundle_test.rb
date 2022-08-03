require "test_helper"

class BundleTest < ActiveSupport::TestCase
  test "#prev returns the quote's previous date when it exists" do
    assert_equal bundles(:today), bundles(:next_week).prev  end

  test "#prev returns nil when the quote has no previous date" do
    assert_nil bundles(:today).prev
  end
end
