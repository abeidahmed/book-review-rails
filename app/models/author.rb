class Author < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  scope :order_by_date, -> { order(created_at: :desc) }

  has_many :categorizations
  has_many :books, through: :categorizations

  DEFAULT_AUTHOR = "NA"

  def self.create_default_author
    if self.all.count == 0
      author = self.new(name: DEFAULT_AUTHOR, description: "System generated")
      author.save
    end
  end

  def self.move_to_default_author(del_author_id)
    books = Book.joins(:categorizations).where("categorizations.author_id" => del_author_id)
    if !books.nil?
      author = self.find_by(name: DEFAULT_AUTHOR)
      books.each do |book|
        book.categorizations.each do |indi_book|
          if indi_book.author_id == del_author_id
            indi_book.author_id = author.id
            indi_book.save
          end
        end
      end
    end
  end
end
