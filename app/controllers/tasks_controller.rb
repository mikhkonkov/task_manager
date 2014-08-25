class TasksController < ApplicationController
  def new
    @user = current_user
    @task = @user.created_tasks.build
  end

  def show

  end

  def create
    @user = current_user
    @task = TaskCreateType.new(params[:task])
    # @task.save
    # render plain: @task.errors.inspect
    if @task.save
      flash[:success] = "Task added"
      redirect_to @user
    else
      render :new
    end
  end

  def destroy
  end
end
