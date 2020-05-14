class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.order_by_date
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_param)
    if @category.save
      redirect_to admin_categories_path
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
