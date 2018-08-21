require 'rails_helper'

RSpec.feature "Notes", type: :feature do
  describe "create" do
    it "has the right category session" do
        user = User.create(firstname:"James",lastname:"Wong",email:"james@gmail.com",password:"password")
        category = user.categories.create(name:"Rails")
        login_as(user)
        visit "/"
        
        click_on "Rails"
        
        expect(page).to have_content "Rails"
        
        click_on "New notes"
        
        expect(current_path).to eq new_note_path
        expect(page).to have_content "Rails's notes"
    end
  end
end
