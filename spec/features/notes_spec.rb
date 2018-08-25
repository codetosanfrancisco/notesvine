require 'rails_helper'

RSpec.feature "Notes", type: :feature do
  
  before do
    @user = User.create(firstname:"James",lastname:"Wong",email:"james@gmail.com",password:"password")
    @category = @user.categories.create(name:"Rails")
    @category1 = @user.categories.create(name:"JS")
    login_as(@user,:scope => :user)
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
        select 'Rails'
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
  end
    describe "show" do
      it "can show the note" do
        note = Note.create(title:"Hello",description:"Hello",code:"Hello",remark:"Hello",importance:0,category: @category)
        visit note_path(note)
        
        expect(page).to have_content note.title
        expect(page).to have_content note.code
      end
      
    end
    
    
    describe "edit" do
      before do
        @note = Note.create(title:"Hello",description:"Hello",code:"Hello",remark:"Hello",importance:0,category: @category)
      end
      
      it "only notes creator can create note" do
        visit note_path(@note)
        
        expect(page.status_code).to eq 200
      end
      
      it "other cannot edit the note" do
        logout(:user)
        user = User.create(firstname:"James",lastname:"Wong",email:"jameswong@gmail.com",password:"password")
        login_as(user,:scope => :user)
        
        visit edit_note_path(@note)
        
        expect(current_path).to eq root_path
      end

    
    describe "move" do
      
      it "can be moved from one category to another" do
        visit note_path(@note)
        
        within('.selectpicker') do
          click_on "JS"
        end
      
        expect(page.status_code).to eq 200
      end
      
    end
    
  end
end
