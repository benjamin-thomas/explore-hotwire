class Quote < ApplicationRecord
  belongs_to :company

  broadcasts_to ->(quote) { [quote.company, "quotes"] }, inserts_by: :prepend

  validates :name, presence: true

  scope :by_created_at_desc, -> { order(created_at: :desc) }
end
