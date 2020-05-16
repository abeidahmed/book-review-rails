class Category < ApplicationRecord
  validates :title, presence: true, uniqueness: { case_sensitive: false }

  scope :order_by_date, -> { order(created_at: :desc) }

  has_many :books

  def self.create_default_category
    if self.all.count == 0
      category = self.new(title: "Uncategorized", description: "System generated")
      category.save
    end
  end

  def self.move_to_uncategorized(del_category_id)
    books = Book.where(category_id: del_category_id)
    if !books.nil?
      uncategorized = self.find_by(title: "Uncategorized")
      books.each do |book|
        book.category_id = uncategorized.id
        book.save
      end
    end
  end
end
