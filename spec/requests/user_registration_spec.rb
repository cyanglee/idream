require 'spec_helper'

describe "UserRegistration" do
  before(:each) do
    @user = mock('User')
    @user.stub!(:first_name => "test", :last_name => "user", :email => "test@example.com", :username => "foo", :password => "111111")
  end

  it "test user registers as a volunteer" do
    # sign up as a volunteer
    visit new_user_registration_path
    within(".content") do
      check 'user_volunteer'
      fill_in 'user_first_name', :with => @user.first_name
      fill_in 'user_last_name', :with => @user.last_name
      fill_in 'user_email', :with => @user.email
      fill_in 'user_password', :with => @user.password
      fill_in 'user_password_confirmation', :with => @user.password
    end
    click_button I18n.t('ui.navigation.sign_up')

    # verify the page is redirected to the correct page
    page.should have_content(I18n.t("devise.registrations.inactive_signed_up"))
    # verify the email has been sent
    last_email.nil?.should == false
    # verify recipient
    last_email.to[0].should == @user.email

    # click on the link to confirm the account
    regex = Regexp.new(/a href="(.*)"/)
    matches = regex.match(last_email.body.to_s)

    visit matches[1]
    # verify the cofirmation message
    page.should have_content I18n.t("devise.confirmations.confirmed")
    # verify the identify as a volunteer
    page.should have_content I18n.t("ui.navigation.job.browse_jobs")
    page.should_not have_content I18n.t("ui.navigation.job.post_jobs")
  end

  it "test user registers as a school admin" do
    # sign up as a volunteer
    visit new_user_registration_path
    within(".content") do
      check 'user_organization'
      fill_in 'user_first_name', :with => @user.first_name
      fill_in 'user_last_name', :with => @user.last_name
      fill_in 'user_email', :with => @user.email
      fill_in 'user_password', :with => @user.password
      fill_in 'user_password_confirmation', :with => @user.password
    end
    click_button I18n.t('ui.navigation.sign_up')

    # verify the page is redirected to the correct page
    page.should have_content(I18n.t("devise.registrations.inactive_signed_up"))
    # verify the email has been sent
    last_email.nil?.should == false
    # verify recipient
    last_email.to[0].should == @user.email

    # click on the link to confirm the account
    regex = Regexp.new(/a href="(.*)"/)
    matches = regex.match(last_email.body.to_s)

    visit matches[1]
    # verify the cofirmation message
    page.should have_content I18n.t("devise.confirmations.confirmed")
    # verify the identify as a volunteer
    page.should have_content I18n.t("ui.navigation.manage_schools")

    # verify the redirect path
    user = User.find_by_email(@user.email)
    current_path.should == user_organization_admins_path(user)
  end

end
