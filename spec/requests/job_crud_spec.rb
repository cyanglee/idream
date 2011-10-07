require 'spec_helper'

feature "JobCrud" do
    before do
        Factory(:organizations)
    end

    scenario "test org admin CRUD a new job" do
        # user login as an org admin
        user = Factory(:org_admin)    
        sign_in_user(user)    
        page.should have_content I18n.t('ui.navigation.job.post_jobs')

        # create a new job
        click_link('Post Volunteer Jobs')
        fill_in 'job_title', :with => "test title"
        fill_in 'job_description', :with => "test desc"
        click_button('Create Job')

        page.should have_content('Successfully created job')

        # view job

        click_link('View All')
        page.should have_content('test title')
        page.should have_content('test desc')
        page.should have_content('Org 1')

        # update job
        click_link('Edit')
        page.should have_content('Edit Job')
        fill_in 'Title', :with => "updated title"
        fill_in 'Description', :with => "updated desc"
        click_button('Update Job')

        page.should have_content('Successfully updated job')

        # There is a problem in capybara which prevents launchy to open the browser.
        # This will be fixed in the next release of launchy
        # save_and_open_page
    end
end