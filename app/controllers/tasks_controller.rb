class TasksController < ApplicationController
  def new
    @user = current_user
    @task = @user.created_tasks.build
  end

  def show
    @task = Task.find(params[:id])
  end

  def create
    @user = current_user
    @task = TaskCreateType.new(params[:task])
    if @task.save
      flash[:success] = "Task added"
      redirect_to user_task_path(@user, @task)
    else
      render :new
    end
  end

  def destroy
  end
end
