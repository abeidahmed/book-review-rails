class Author < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  scope :order_by_date, -> { order(created_at: :desc) }
end
