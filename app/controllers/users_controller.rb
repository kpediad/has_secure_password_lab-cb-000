class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    redirect_to new_user_path unless params[:user][:password] == params[:user][:password_confirmation]
    new_user = User.create(user_params)
    session[:user_id] = new_user.id
    redirect_to home_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
