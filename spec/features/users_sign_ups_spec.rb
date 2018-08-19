require 'rails_helper'

RSpec.feature "UsersSignUps", type: :feature do
  describe "sign up" do
    it "users can sign up" do
        visit "/users/sign_up"
        
        fill_in "user[firstname]",with:"Jonas"
        fill_in "user[lastname]",with:"Goh"
        fill_in "user[email]",with:"jonas@gmail.com"
        fill_in "user[password]",with:"password"
        fill_in "user[password_confirmation]",with:"password"
        
        click_button "Sign up"
        
        expect(current_path).to eq root_path
        expect(page).to have_content "Jonas Goh"
    end
  end
end
