require 'rails_helper'

describe "User model" do
  before { @user = User.new(name: "Test user", email: "test@example.com",
                            password: "foobar", password_confirmation: "foobar") }
  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  its(:name) { should == "Test user" }
  its(:email) { should == "test@example.com" }
  it { should be_valid }
  it { expect { subject.save }.to change { User.count }.by(1) }

  context "when email not validates" do
    before { subject.email = "" }
    it { should_not be_valid }
  end

  context "Users without attrs" do
    before { @user = User.new }
    subject { @user }
    it { expect { subject.save }.to change { User.count }.by(0) }
    it { should_not be_valid }
  end

  context "when passwords is equals" do
    its(:password) { should == subject.password_confirmation }
  end

  context "when password is not present" do
    before { subject.password = subject.password_confirmation = " " }
    it { should_not be_valid }
  end

  describe "return value of authenticate method" do
    before { subject.save }
    let(:found_user) { User.find_by_email(subject.email) }

    context "with valid password" do
      it { should eq found_user.authenticate(subject.password) }
    end

    context "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }
      it { should_not eq user_for_invalid_password }
    end

  end
end
