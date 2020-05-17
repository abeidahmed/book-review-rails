class StaticPagesController < ApplicationController
  def home
    @books = Book.all
    @categories = Category.all
  end
end
