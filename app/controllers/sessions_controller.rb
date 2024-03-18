class SessionsController < ApplicationController
  before_action :logged_in?, only: [:new, :create]
  def new

  end

  def create
    @user = User.find_by(email: params[:email], password: params[:password])
    if  @user
      session[:user_id] = @user.id
      flash[:notice] = "ログイン成功"
      redirect_to tasks_path
    else
      flash[:notice] = "ログイン失敗"
      render action: "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_sessions_path
  end

  private
  def logged_in?
    if session[:user_id]
      @user = User.find(session[:user_id])
      flash[:notice] = "ログインしています"
      redirect_to tasks_path
    end
  end

end
