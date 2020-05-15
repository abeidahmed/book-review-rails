class Admin::BooksController < ApplicationController
  before_action :is_admin?
  
  def index
    @books = Book.all
  end

  def new
    @book = current_user.books.build
  end

  def create
    @book = current_user.books.build(book_params)
    if @book.save
      redirect_to admin_books_path
      flash.now[:success] = "Successfully created a new book: #{@book.title}"
    else
      render "new"
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(book_params)
      redirect_to admin_books_path
      flash.now[:success] = "Successfully updated a new book: #{@book.title}"
    else
      render "edit"
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :description, :category_id, author_ids: [])
  end
end
