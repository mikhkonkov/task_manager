class Users::TasksController < ApplicationController
  before_action :get_user
  before_action :find_task, only: [ :show, :edit, :destroy, :done ]

  def index
    @created_tasks = @user.created_tasks
    @assigned_tasks = @user.assigned_tasks
  end

  def new
    @task = @user.created_tasks.build
  end

  def show
  end

  def create
    @task = User::TaskCreateType.new(params[:user_task])
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
    @task = User::TaskCreateType.find(params[:id])
    if @task.update(params[:user_task])
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

  def done
    if @task.close
      flash[:success] = "Task is closed"
    else
      flash[:danger] = "Task is not closed"
    end
    redirect_to user_task_path @user, @task
  end

  def search
    query = params[:q]
    if query.present?
      tasks = User::Task.search_with_elasticsearch(query).records
      @created_tasks = tasks.where(creator_id: @user.id)
      @assigned_tasks = tasks.where(assigned_to_id: @user.id)
    else
      @created_tasks = @user.created_tasks
      @assigned_tasks = @user.assigned_tasks
    end

    respond_to do |format|
      format.js
    end
  end

  private
  def get_user
    @user = User.find(params[:user_id])
  end

  def find_task
    @task = User::Task.find(params[:id])
  end
end
