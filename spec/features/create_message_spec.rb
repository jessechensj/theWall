# If created succesfully
# Current path should equal messages_path (messages#index)
# Current page should contain message you just created
# If not created succesfully
# Current path should equal messages_path (messages#index)
# Current page should contain error messages (create test for each error except user reference required).

# messages_path (messages#index) page should contain Log Out button
# Current path should equal newuserpath (users#new) after clicking log out button
require 'rails_helper'
feature "Attempts to create a message" do
    before(:each) do 
        visit new_user_path
        fill_in "user[username]", with: "validname"
        click_button "Register"
        visit new_message_path
    end
    scenario "Successfully create a message" do
        fill_in "message[message]", with: "valid message"
        click_button "Post"
        expect(page).to have_content "valid message"
        expect(page).to have_current_path(messages_path) 
    end
    scenario "Unsuccessfully create a message" do
        fill_in "message[message]", with: "invalid"
        click_button "Post"
        expect(page).to have_current_path(messages_path)
        expect(page).to have_content "Message is too short (minimum is 11 characters)"
    end
    scenario "Logs out" do
        visit messages_path
        click_link('logout')
        expect(page).to have_current_path(new_user_path)
    end
end