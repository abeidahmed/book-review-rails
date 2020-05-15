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

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_param)
      redirect_to admin_categories_path
      flash.now[:success] = "Successfully updated category #{@category.title}"
    else
      render "edit"
    end
  end

  private

  def category_param
    params.require(:category).permit(:title, :description)
  end
end
