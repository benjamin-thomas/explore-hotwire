class Quote < ApplicationRecord
  broadcasts_to ->(_) { "quotes" }, inserts_by: :prepend

  validates :name, presence: true

  scope :by_created_at_desc, -> { order(created_at: :desc) }
end
