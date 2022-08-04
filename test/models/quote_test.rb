require "test_helper"

class QuoteTest < ActiveSupport::TestCase
  test "#by_created_at_desc" do
    assert_equal ["Third quote", "Second quote", "First quote"],
                 Quote.order_by_created_at_desc.pluck(:name)
  end

  test "#total_price" do
    # Fixtures: add `today` + `next week` bundles.
    # 999.99 + (2 * 8.76) + (3 * 1.23) + (4 * 2.34) = 1030.56
    assert_equal 1030.56, quotes(:first).total_price
  end
end

# == Schema Information
#
# Table name: quotes
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :bigint           not null
#
# Indexes
#
#  index_quotes_on_company_id  (company_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#
