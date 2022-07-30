class Quote < ApplicationRecord
  validates :name, presence: true

  scope :by_created_at_desc, -> { order(created_at: :desc) }
end
