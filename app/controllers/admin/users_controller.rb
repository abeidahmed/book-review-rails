class Admin::UsersController < ApplicationController
  before_action :is_admin?

  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    if !@user.admin?
      @user.destroy
      flash[:success] = "Successfully deleted user #{@user.title}."
      redirect_to admin_users_path
    else
      flash[:error] = "Cannot delete an admin."
    end
  end
end
