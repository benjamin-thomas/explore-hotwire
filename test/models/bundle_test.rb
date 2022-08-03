# == Schema Information
#
# Table name: bundles
#
#  id         :bigint           not null, primary key
#  ship_on    :date             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  quote_id   :bigint           not null
#
# Indexes
#
#  index_bundles_on_quote_id              (quote_id)
#  index_bundles_on_quote_id_and_ship_on  (quote_id,ship_on) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (quote_id => quotes.id)
#
require "test_helper"

class BundleTest < ActiveSupport::TestCase
  test "#prev returns the quote's previous date when it exists" do
    assert_equal bundles(:today), bundles(:next_week).prev  end

  test "#prev returns nil when the quote has no previous date" do
    assert_nil bundles(:today).prev
  end
end
