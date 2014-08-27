require 'rails_helper'

describe Users::TasksController do
  subject { page }
  let(:user) { FactoryGirl.create(:user) }
  let(:task) { FactoryGirl.create('user/task') }

  describe "Create task" do
    before { visit new_user_task_path(user, task)}
    let(:submit) { "Add task" }

    it { should have_content('Add task') }

    describe "with invalid information" do
      it "should not create a task" do
        expect { click_button submit }.not_to change(Task, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Title",         with: "Test task"
        fill_in "Description",   with: "test test test test"
        find("option[value='opened']").click
      end

      it "should create a task" do
        expect { click_button submit }.to change(Task, :count).by(1)
      end
    end
  end

  # describe "Delete task" do
  #   before { visit user_task_path(user, task)}
  #   it "should destroy a task" do
  #     subject.save_and_open_page
  #     expect { click_link 'Destroy' }.to change(Task, :count).by(-1)
  #   end
  # end

end
