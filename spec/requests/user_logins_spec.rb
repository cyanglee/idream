require 'spec_helper'

feature "UserLogins" do

    scenario "test user login as volunteer" do
        user = Factory(:volunteer)
        visit new_user_session_path
        within("#content") do
            fill_in 'Email', :with => user.email
            fill_in 'Password', :with => user.password
        end
        click_button('Sign in')

        page.should have_content('Signed in successfully')
        page.should have_no_content('Post Volunteer Works')

        # There is a problem in capybara which prevents launchy to open the browser.
        # This will be fixed in the next release of launchy
        # save_and_open_page
    end

    scenario "test user login as org representative" do
        user = Factory(:org_admin)
        visit new_user_session_path
        within("#content") do
            fill_in 'Email', :with => user.email
            fill_in 'Password', :with => user.password
        end
        click_button('Sign in')

        page.should have_content('Signed in successfully')
        page.should have_content('Post Volunteer Works')
    end

    scenario "test user login as admin" do
        user = Factory(:admin)
        visit new_user_session_path
        within("#content") do
            fill_in 'Email', :with => user.email
            fill_in 'Password', :with => user.password
        end
        click_button('Sign in')

        page.should have_content('Signed in successfully')
        page.find_link("Admin").visible?
    end

end
