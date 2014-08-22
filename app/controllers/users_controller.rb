class UsersController < ApplicationController
  def new
    @user = UserRegistrationType.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = UserRegistrationType.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Task Manager!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
