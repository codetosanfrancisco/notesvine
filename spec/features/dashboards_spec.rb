require 'rails_helper'

RSpec.feature "Dashboards", type: :feature do
  describe "dashboard" do
    it "can visit dashboard" do
        visit "/"
        
        expect(page.status_code).to eq 200
        expect(page).to have_content "My Notes"
    end
  end
end
