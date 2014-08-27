require 'test_helper'

class Admin::UsersControllerTest < ActionController::TestCase
  setup do
    @user = create :user
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should get update" do
    attrs = attributes_for(:user).extract!(:email, :name)
    patch :update, id: @user.id, user: attrs
    assert_response :redirect

    @user.reload

    assert { attrs[:email] == @user.email }
  end

  test "should get destroy" do
    get :destroy, id: @user
    assert_response :redirect

    assert { !User.exists? @user }
  end

end
