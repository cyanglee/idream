require 'spec_helper'

feature "UserLogins" do

  scenario "test user login as volunteer" do
    sign_in_user Factory(:volunteer)
    page.should have_no_content(I18n.t("ui.navigation.job.post_jobs"))

    # There is a problem in capybara which prevents launchy to open the browser.
    # This will be fixed in the next release of launchy
    # save_and_open_page
  end

  scenario "test user login as org admin" do
    sign_in_user Factory(:org_admin)
    page.should have_content(I18n.t("ui.navigation.job.post_jobs"))
  end

  scenario "test user login as admin" do
    sign_in_user Factory(:admin)
    #page.find_link("Admin").visible?
  end

end