require 'rails_helper'

describe "UserPages" do
  describe "Sign up page" do
    before { visit signup_path }
    subject { page }

    it { should have_content('Sign up')}
    it { should have_title('Sign up')}
  end
end
