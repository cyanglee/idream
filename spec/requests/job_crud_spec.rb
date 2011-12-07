# coding: utf-8
require 'spec_helper'

feature "JobCrud", :focus => true  do

  scenario "test org admin create a new job" do
    # user login as an org admin
    sign_in_user Factory(:org_admin)

    # create a new job
    visit new_job_path
    fill_in 'job_title', :with => "test title"
    fill_in 'job_begin_date', :with => '2011-11-23'
    fill_in 'job_end_date', :with => '2011-11-25'
    fill_in 'job_education', :with => "大專以上"
    fill_in 'job_desc', :with => "test desc"
    fill_in 'job_contact', :with => 'School Admin'
    fill_in 'job_contact_phone', :with => '0921123456'
    fill_in 'job_contact_email', :with => 'abc@gmail.com'

    click_button I18n.t("simple_form.labels.job.add")
    
    page.should have_content I18n.t("ui.job.successfully_added")
  end

  scenario "test org admin CRUD a new job" do
    # user login as an org admin
    sign_in_user Factory(:org_admin)

    # create a new job
    click_link('Post VolunteerJob Jobs')
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