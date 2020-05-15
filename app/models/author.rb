class Author < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  scope :order_by_date, -> { order(created_at: :desc) }

  has_many :categorizations
  has_many :books, through: :categorizations
end
