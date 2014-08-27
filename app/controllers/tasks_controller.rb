class TasksController < ApplicationController
  before_action :get_user
  before_action :find_task, only: [ :show, :edit, :destroy ]

  def new
    @task = @user.created_tasks.build
  end

  def show
  end

  def create
    @task = TaskCreateType.new(params[:task])
    if @task.save
      flash[:success] = "Task added"
      redirect_to user_task_path(@user, @task)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @task = TaskCreateType.find(params[:id])
    if @task.update(params[:task])
      flash[:success] = "Task updated"
      redirect_to user_task_path(@user, @task)
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to @user
  end

  private
  def get_user
    @user = User.find(params[:user_id])
  end

  def find_task
    @task = Task.find(params[:id])
  end
end
