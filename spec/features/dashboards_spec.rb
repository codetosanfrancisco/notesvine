require 'rails_helper'

RSpec.feature "Dashboards", type: :feature do
  describe "dashboard" do
    it "can visit dashboard" do
        user = User.create(firstname:"James",lastname:"Wong",email:"james@gmail.com",password:"password")
        login_as(user)
        visit "/"
        
        expect(page.status_code).to eq 200
        expect(page).to have_content "MyNotes"
    end
  end
end
