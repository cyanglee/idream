# coding: utf-8
require 'spec_helper'

describe "Job tests" do
  describe "Test creating, editing, and deleting jobs as a school admin" do

    it "should be able to creat jobs as a shcool admin" do
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
    
    it "should be able to update a existing job posted by a school admin" do
      sign_in_user Factory(:org_admin_with_job)
      click_link I18n.t("ui.navigation.job.manage_jobs")
      click_link I18n.t("simple_form.labels.job.edit")
      fill_in 'job_title', :with => "modified title"
      fill_in 'job_desc', :with => "modified desc"
      
      click_button I18n.t("simple_form.labels.job.add")
      page.should have_content I18n.t("ui.job.successfully_updated")
      
    end
    
    it "should be able to delete a job posted by a school admin" do
      sign_in_user Factory(:org_admin_with_job)
      click_link I18n.t("ui.navigation.job.manage_jobs")
      click_link I18n.t("simple_form.labels.job.delete")  

      page.should have_content I18n.t("ui.job.successfully_destroyed")
    end

    
    it "should be able to see the applicants" do
      
      @school_admin = Factory(:org_admin_with_job)
      @volunteer = Factory(:volunteer)

      # sign in as a volunteer
      sign_in_user @volunteer
      # browse existing jobs
      click_link I18n.t("ui.navigation.job.browse_jobs")
      # show details of a job
      click_link I18n.t("simple_form.labels.job.show")
      # apply for the job
      click_button I18n.t("simple_form.labels.job.apply")      
      # sign out and sign in again as an school admin
      sign_out
      sign_in_user @school_admin
      # click_link I18n.t("ui.navigation.job.all_jobs")
      click_link I18n.t("ui.navigation.job.manage_jobs")
      click_link I18n.t("simple_form.labels.job.applicant")

      # should see the volunteer's email
      page.should have_content(@volunteer.email)
    end


  end

  describe "Test viewing and applying for jobs as a volunteer" do

    let(:job) { Factory(:job) }
    let(:volunteer) { Factory(:volunteer) }  
    let(:volunteer_with_job) { Factory(:volunteer_with_job) }
    
    it "should be able to view the jobs as a registered volunteer" do
      job
      sign_in_user volunteer
      click_link I18n.t("ui.navigation.job.browse_jobs")
      
      page.should have_content I18n.t("simple_form.labels.job.show")

    end

    it "should be able to see the jobs that the volunteer applied to" do
      # create a new job
      job
      sign_in_user volunteer
      # browse existing jobs
      click_link I18n.t("ui.navigation.job.browse_jobs")
      # show details of a job
      click_link I18n.t("simple_form.labels.job.show")
      # apply for the job
      click_button I18n.t("simple_form.labels.job.apply")      
      # go to my jobs page
      click_link I18n.t("ui.navigation.job.my_jobs")

      # expect to see the applied job
      page.should have_content('test title')
    end

  end
end