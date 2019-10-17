class Admin::UsersController < ApplicationController
  before_action :require_admin
  def index
    @users = User.select(:id, :name, :email, :admin, :created_at, :updated_at, :password_digest)
  end
  
  def show
    @user = User.find(params[:id])
    @tasks = @user.tasks.created_at.page(params[:page]).per(8)
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_user_url(@user), notice: t('flash.user_create')
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to admin_user_url(@user), notice: t('flash.user_update')
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_url, notice: t('flash.user_destroy')
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation)
  end

  def require_admin
    raise Forbidden unless current_user.admin?
    # redirect_to root_url unless current_user.admin?
  end
end
