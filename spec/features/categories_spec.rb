require 'rails_helper'

RSpec.feature "Categories", type: :feature do
  describe "create category" do
    before do
      user = User.create(firstname:"James",lastname:"Wong",email:"james@gmail.com",password:"password")
      login_as(user)
      visit "/"
      within("div[@id='sidebar']") do
          click_link "New category"
      end
    end
    it "can go to new category" do
        
        expect(current_path).to eq new_category_path
        expect(page).to have_content "New category"
    end
    
    it "can create a new category" do
      
      fill_in "category[name]",with:"Rails"
      
      click_on "Create"
      
      expect(page).to have_content "Rails"
    end
  end
end
