class Admin::AuthorsController < ApplicationController
  def index
    @authors = Author.order_by_date
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      redirect_to admin_authors_path
      flash.now[:success] = "Successfully created a new author: #{@author.name}"
    else
      render "new"
    end
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    if @author.update_attributes(author_params)
      redirect_to admin_authors_path
      flash.now[:success] = "Successfully updated author #{@author.name}"
    else
      render "edit"
    end
  end

  private

  def author_params
    params.require(:author).permit(:name, :description)
  end
end
