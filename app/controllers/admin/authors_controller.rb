class Admin::AuthorsController < ApplicationController
  before_action :is_admin?

  def index
    @authors = Author.order_by_date
  end

  def new
    @author = Author.new
  end

  def create
    # create "NA" for default book instantiation.
    Author.create_default_author

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

  def destroy
    @author = Author.find(params[:id])
    # before deleting the author, the books that is labelled with that author
    # should be moved to "NA".
    Author.move_to_default_author(@author.id)
    # after the book has been moved to the default author, we can then
    # delete the author.
    @author.destroy
    redirect_to admin_authors_path
  end

  private

  def author_params
    params.require(:author).permit(:name, :description)
  end
end
