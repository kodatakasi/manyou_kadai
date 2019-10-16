class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
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
      redirect_to admin_user_url(@user), notice: "ユーザー登録しました。"
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to admin_user_url(@user), notice: "ユーザー情報を更新しました。"
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      render_to admin_users_url, notice: "ユーザーを削除しました。"
    end
  end

  private
  def user_params
    params_require(:user).permit(:name, :email, :admin, :password, :password_confirmation)
  end
end
