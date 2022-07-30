class Quote < ApplicationRecord
  after_create_commit -> { broadcast_prepend_to "quotes" }
  after_destroy_commit -> { broadcast_remove_to "quotes" }

  validates :name, presence: true

  scope :by_created_at_desc, -> { order(created_at: :desc) }
end
