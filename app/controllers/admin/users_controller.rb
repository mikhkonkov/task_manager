class Admin::UsersController < ApplicationController
  before_action :get_user, except: [ :index, :fetch_user ]

  def index
    @users = User.all
  end

  def edit
  end

  def update
    @user = @user.becomes AdminUserEditType
    if @user.update(params[:user])
      flash[:success] = "User #{@user.name} is updated"
      redirect_to admin_users_path(@user)
    else
      flash[:danger] = "User isn't updated"
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path
  end

  def fetch_user
    @selected = params[:id].present? ? User.where(id: params[:id]) : User.all
    respond_to do |format|
      format.js
    end
  end

  private
  def get_user
    @user = User.find(params[:id])
  end
end
