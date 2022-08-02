class Quote < ApplicationRecord
  belongs_to :company
  has_many :bundles, dependent: :destroy

  broadcasts_to ->(quote) { [quote.company, "quotes"] }, inserts_by: :prepend

  validates :name, presence: true

  scope :order_by_created_at_desc, -> { order(created_at: :desc) }
end
