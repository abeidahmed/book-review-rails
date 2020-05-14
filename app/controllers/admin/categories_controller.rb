class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_param)
    if @category.save
      redirect_to "/admin/categories"
      flash.now[:success] = "Successfully created a new category #{@category.title}."
    else
      render "new"
    end
  end

  private

  def category_param
    params.require(:category).permit(:title, :description)
  end
end
