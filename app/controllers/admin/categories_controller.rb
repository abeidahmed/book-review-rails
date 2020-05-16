class Admin::CategoriesController < ApplicationController
  before_action :is_admin?
  
  def index
    @categories = Category.order_by_date
  end

  def new
    @category = Category.new
  end

  def create
    # create "uncategorized category" for default book instantiation.
    Category.create_default_category

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

  def destroy
    @category = Category.find(params[:id])
    # before deleting the category, the books that is labelled with that category
    # should be moved to "uncategorized category".
    Category.move_to_uncategorized(@category.id)
    # after the book has been moved to the default category, we can then
    # delete the category.
    @category.destroy
    redirect_to admin_categories_path
  end

  private

  def category_param
    params.require(:category).permit(:title, :description)
  end
end
