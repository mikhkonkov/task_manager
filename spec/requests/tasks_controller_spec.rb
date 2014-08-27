require 'rails_helper'

describe Users::TasksController do
  subject { page }
  let(:user) { FactoryGirl.create(:user) }
  # let(:task) { FactoryGirl.create('user/task') }

  describe "Create task" do
    before { visit new_user_task_path(user)}
    let(:submit) { "Add task" }

    it { should have_content('Add task') }

    describe "with invalid information" do
      it "should not create a task" do
        expect { click_button submit }.not_to change(User::Task, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Title",         with: "Test task"
        fill_in "Description",   with: "test test test test"
        find("option[value='opened']").click
      end

      it "should create a task" do
        expect { click_button submit }.to change(User::Task, :count).by(1)
      end
    end
  end
end
