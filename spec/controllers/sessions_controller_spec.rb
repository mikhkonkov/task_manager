require 'rails_helper'

describe "Authentication" do

  subject { page }

  context "signin page" do
    before { visit sigin_path }

    it { should have_content('Sign in')}
    it { should have_title('Sign in')}
  end

end
