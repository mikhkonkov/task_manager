require 'rails_helper'

describe Task do
  let(:user) { FactoryGirl.create(:user) }
  before { @task = user.created_tasks.build(title: "test task", discription: "test discription") }

  subject { @task }

  it { should respond_to(:title) }
  it { should respond_to(:creator_id) }
  it { should respond_to(:creator) }
  its(:creator) { should eq user }

  it { should be_valid }

end
