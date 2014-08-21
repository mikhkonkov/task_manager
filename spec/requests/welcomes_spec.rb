require 'rails_helper'

describe "Welcomes" do
  describe "Welcome page" do
    before { visit root_path }
    subject { page }

    it { should have_title('Task Manager | Home') }
    it { should have_content('Welcome to task manager') }
  end
end
