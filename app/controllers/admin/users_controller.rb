class Admin::UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new
    if @user.save
      redirect_to admin_users_path 
    else
      render 'new', status: :unprocessable_entity
    end
  end
  def edit
  end

  def show
  end

  def index
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end

