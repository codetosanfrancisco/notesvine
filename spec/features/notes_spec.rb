require 'rails_helper'

RSpec.feature "Notes", type: :feature do
  
  before do
    @user = User.create(firstname:"James",lastname:"Wong",email:"james@gmail.com",password:"password")
    @category = @user.categories.create(name:"Rails")
    login_as(@user)
  end
  
  describe "create" do
    before do
      visit "/"
      click_on "Rails"
      expect(page).to have_content @category.name
      click_on "New notes"
    end
    it "has the right category session" do
        expect(current_path).to eq new_note_path
        expect(page).to have_content @category.name
    end
    
    it "can create new notes" do
        fill_in "note[title]",with:"Hello world"
        choose ("note_importance_0")
        fill_in "note[description]",with:"Hello World"
        fill_in "note[code]",with:'
          require \'rails_helper\'
          
          RSpec.feature "Notes", type: :feature do
            describe "create" do
              before do
                user = User.create(firstname:"James",lastname:"Wong",email:"james@gmail.com",password:"password")
                category = user.categories.create(name:"Rails")
                login_as(user)
                visit "/"
                click_on "Rails"
                expect(page).to have_content "Rails"
                click_on "New notes"
              end
              it "has the right category session" do
                  expect(current_path).to eq new_note_path
                  expect(page).to have_content "Rails"
              end
              
              it "can create new notes" do
                  fill_in "note[title]",with:"Hello world"
                  fill_in "note[description]",with:"Hello World"
                  fill_in "note[code]",with:"<div>Hello world</div>"
                  fill_in "note[remark]",with:"Hello world"
                  
                  expect { click_on "Save note"}.to change(Note,:count).by(1)
              end
            end
          end
        '
        fill_in "note[remark]",with:"Hello world"
        
        expect { click_on "Save note"}.to change(Note,:count).by(1)
    end
    
    describe "show" do
      it "can show the note" do
        note = Note.create(title:"Hello",description:"Hello",code:"Hello",remark:"Hello",importance:0,category: @category)
        visit note_path(note)
        
        expect(page).to have_content note.name
        expect(page).to have_content note.code
      end
      
    end
  end
end
