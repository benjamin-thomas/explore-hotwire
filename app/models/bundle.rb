class Bundle < ApplicationRecord
  belongs_to :quote
  has_many :items, class_name: "BundleItem", dependent: :destroy

  validates :ship_on, presence: true, uniqueness: { scope: :quote_id }

  scope :order_by_ship_on_asc, -> { order(:ship_on) }

  # @return [Bundle, nil]
  def prev
    quote
      .bundles
      .where(ship_on: ...ship_on)
      .order_by_ship_on_asc
      .last
  end
end

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
