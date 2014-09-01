class Admin::Users::Tasks::CommentsController < ApplicationController
  before_action :find_user
  before_action :find_task

  def new
    @comment = @task.comments.build(user_id: @user.id)
  end

  def create
    @comment = @task.comments.new(comment_params)

    if @comment.save
      flash[:success] = "Comment added"
      redirect_to admin_user_task_comment_path(@user, @task, @comment)
    else
      render :new
    end
  end

  def index
    @comments = @task.comments
  end

  def show
    @comment = User::Task::Comment.find(params[:id])
  end

  def edit
    @comment = User::Task::Comment.find(params[:id])
  end

  def update
    @comment = User::Task::Comment.find(params[:id])
    if @comment.update(comment_params)
      flash[:success] = "Comment updated"
      redirect_to admin_user_task_comment_path(@user, @task, @comment)
    else
      render :edit
    end
  end

  def destroy
    @comment = User::Task::Comment.find(params[:id])

    @comment.destroy

    redirect_to admin_user_task_comments_path(@user, @task)
  end

  private
  def comment_params
    params.require(:user_task_comment).permit(:content, :user_id, :user, :task_id, :task)
  end

  def find_user
    @user = User.find(params[:user_id])
  end

  def find_task
    @task = User::Task.find(params[:task_id])
  end
end
