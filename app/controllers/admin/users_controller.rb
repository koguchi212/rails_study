class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_admin

  def index
    @q = User.ransack(params[:q])
    @users = @q.result.page(params[:page]).per(5)
  end

  
  def show
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'ユーザーを作成しました'
      redirect_to admin_users_path 
    else
      render 'new', status: :unprocessable_entity
    end
  end


  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "ユーザーを更新しました"
      redirect_to admin_user_path(@user.id)
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    flash[:success] = 'ユーザーを削除しました'
    redirect_to admin_users_path
  end
  
  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def require_admin
    redirect_to root_path unless current_user.admin?
  end
end

