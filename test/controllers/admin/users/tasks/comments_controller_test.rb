require 'test_helper'

class Admin::Users::Tasks::CommentsControllerTest < ActionController::TestCase

  setup do
    @user = create :user
    @task = create 'user/task'
    @comment = create 'user/task/comment'
  end

  test "should get index" do
    get :index, user_id: @user.id, task_id: @task.id
    assert_response :success
  end

  test "should get new" do
    get :new, user_id: @user.id, task_id: @task.id
    assert_response :success
  end

  test "should create" do
    attrs = attributes_for('user/task/comment')

    post :create, user_id: @user.id, task_id: @task.id, user_task_comment: attrs
    assert_response :redirect

    assert { User::Task::Comment.find_by_content attrs[:content] }
  end

  test "should get show" do
    get :show, user_id: @user.id, task_id: @task.id, id: @comment.id
    assert_response :success
  end

  test "should get edit" do
    get :edit, user_id: @user.id, task_id: @task.id, id: @comment.id
    assert_response :success
  end

  test "should update" do
    attrs = attributes_for('user/task/comment').extract!(:content)
    patch :update, user_id: @user.id, task_id: @task.id, id: @comment.id, user_task_comment: attrs
    assert_response :redirect

    @comment.reload

    assert { @comment.content == attrs[:content] }
  end

  test "destroy" do
    delete :destroy, user_id: @user.id, task_id: @task.id, id: @comment.id
    assert_response :redirect

    assert { !User::Task::Comment.exists? @comment }
  end

end
