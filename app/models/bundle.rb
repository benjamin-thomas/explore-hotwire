class Bundle < ApplicationRecord
  belongs_to :quote

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
