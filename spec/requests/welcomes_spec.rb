require 'rails_helper'

describe "Welcomes" do
  describe "Welcome page" do
    it "works! (now write some real specs)" do
      visit 'welcome/index'
      expect(page).to have_title('Task manager | Home')
    end
  end
end
