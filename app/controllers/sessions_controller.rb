class SessionsController < ApplicationController
  def new
    @session = UserLoginType.new
  end

  def create
    @session = UserLoginType.new(params[:user_login_type])
    if @session.valid?
      user = @session.user
      sign_in(user)
      redirect_to user_path user
    else
      flash[:danger] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
