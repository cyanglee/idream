# coding: utf-8
require 'spec_helper'

describe "JobCrud" do

  it "test org admin create a new job" do
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
  
  it "test org admin update a job" do
    sign_in_user Factory(:org_admin_with_job)
    visit jobs_manage_path
    click_link I18n.t("simple_form.labels.job.edit")
    fill_in 'job_title', :with => "modified title"
    fill_in 'job_desc', :with => "modified desc"
    
    click_button I18n.t("simple_form.labels.job.add")
    page.should have_content I18n.t("ui.job.successfully_updated")
    
  end
end