# If created sucessfully
# Current path should equal messages_path (messages#index)
# Current page should contain "Welcome #{testusername}"
# If not created succesfully
# Current path should equal newuserpath (users#new)
# Current page should contain error messages (create test for each error)
require 'rails_helper'
feature "User creates an account" do
    before(:each) do 
      visit new_user_path
    end
    scenario "successfully registers" do
        fill_in "user[username]", with: "validname"
        click_button "Register"
        expect(page).to have_content "Welcome validname"
        expect(page).to have_current_path(messages_path) 
    end
    scenario "register without a name" do
        click_button "Register"
        expect(page).to have_content "Username can't be blank"
        expect(page).to have_current_path(new_user_path)
    end
    scenario "register with a name shorter than 6" do
        fill_in "user[username]", with: "Shane"
        click_button "Register"
        expect(page).to have_content "Username is too short"
        expect(page).to have_current_path(new_user_path)
    end
end