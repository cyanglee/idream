module UserHelper
  def sign_in_user(user)
    user.update_attributes(:confirmation_token => nil, :confirmed_at => Time.now)
    visit new_user_session_path
    within(".content") do
        fill_in 'user_email', :with => user.email
        fill_in 'user_password', :with => user.password
    end
    click_button I18n.t("ui.navigation.sign_in")

    page.should have_content("Hi, #{user.first_name}")
  end
end