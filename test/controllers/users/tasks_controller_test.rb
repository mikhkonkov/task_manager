require 'test_helper'

class Users::TasksControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    @task = create 'user/task'
  end

  test "should get index" do
    get :index, user_id: @user.id
    assert_response :success
  end

end
