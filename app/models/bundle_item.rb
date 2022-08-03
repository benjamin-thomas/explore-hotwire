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
class BundleItem < ApplicationRecord
  belongs_to :bundle

  validates :name, presence: true
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :unit_price, presence: true, numericality: { greater_than: 0 }
end
