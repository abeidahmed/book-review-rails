class Book < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :author

  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :description, length: { maximum: 500 }

  scope :order_by_date, -> { order(created_at: :desc) }
end
