class UsersController < ApplicationController
  def new
    @user_new = User.new
  end

  def edit
    @user = User.find(session[:user_id])
  end

  def update
    @user = User.find(session[:user_id])
    if @user.update(user_params)
      flash.now[:notice] = "ユーザー情報更新成功"
      redirect_to users_path
    else
      flash.now[:alert] = "ユーザー情報更新失敗"
      render adtion: "edit"
    end
  end

  def show
    @user = User.find(session[:user_id])
  end

  def create
    @user_new = User.new(user_params)
    if @user_new.save
      session[:user_id] = @user_new.id
      flash.now[:notice] = "ユーザー新規登録成功"
      redirect_to tasks_path
    else
      flash.now[:alert] = "ユーザー新規登録失敗"
      render action: "new"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
