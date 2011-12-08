# coding: utf-8
require 'spec_helper'

feature "JobCrud" do

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
end