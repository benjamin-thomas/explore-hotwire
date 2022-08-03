require "test_helper"

class BundleItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: bundle_items
#
#  id          :bigint           not null, primary key
#  maybe_descr :text
#  name        :string           not null
#  quantity    :integer          not null
#  unit_price  :decimal(10, 2)   not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  bundle_id   :bigint           not null
#
# Indexes
#
#  index_bundle_items_on_bundle_id  (bundle_id)
#
# Foreign Keys
#
#  fk_rails_...  (bundle_id => bundles.id)
#
