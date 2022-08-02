class Bundle < ApplicationRecord
  belongs_to :quote

  validate :ship_on, presence: true, uniqueness: { scope: :quote_id }

  scope :by_ship_on_asc, -> { order(:ship_on) }
end
