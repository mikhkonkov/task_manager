require 'rails_helper'

describe "Welcomes", :type => :request do
  describe "Welcome page" do
    it "works! (now write some real specs)" do
      visit 'welcome/index'
      expect(page).to have_content('Welcome')
    end
  end
end
