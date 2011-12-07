module UserHelper
  include Devise::TestHelpers
  
  def sign_in_user(user)
    user.update_attributes(:confirmation_token => nil, :confirmed_at => Time.now)
    visit new_user_session_path
    within(".content") do
      fill_in 'user_email', :with => user.email
      fill_in 'user_password', :with => user.password
    end
    click_button I18n.t("ui.navigation.sign_in")

    page.should have_content I18n.t("ui.navigation.sign_out")
  end

  def login_school_admin
    before(:each) do
      # @request.env["devise.mapping"] = Devise.mappings[:organization]
      # sign_in Factory.create(:admin) # Using factory girl as an example
      @user = Factory(:org_admin)
      sign_in :user, @user 
    end
  end

  def login_volunteer
    before(:each) do
      # @request.env["devise.mapping"] = Devise.mappings[:user]
      # user = Factory.create(:user)
      # user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the confirmable module
      sign_in user Factory(:volunteer)
    end
  end
end