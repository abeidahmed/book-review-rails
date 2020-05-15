class Category < ApplicationRecord
  validates :title, presence: true, uniqueness: { case_sensitive: false }

  scope :order_by_date, -> { order(created_at: :desc) }

  has_many :books
end
