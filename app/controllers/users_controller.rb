class UsersController < ApplicationController
  def new
    @user = UserRegistrationType.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = UserRegistrationType.new(params[:user])
    if @user.save
      flash[:success] = "Welcome to the Task Manager!"
      redirect_to @user
    else
      render :new
    end
  end

end
