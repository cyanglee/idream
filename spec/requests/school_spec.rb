# coding: utf-8
require 'spec_helper'

describe "Schools" do
  
  it "should be able to update school profile as a school admin" do
    sign_in_user Factory(:org_admin)
    click_link I18n.t("ui.navigation.manage_schools")
    click_link I18n.t("ui.school.edit")
    
    fill_in 'organization_contact', :with => 'New Contact'
    click_button I18n.t("ui.school.submit")
    
    page.should have_content I18n.t("ui.school.successfully_updated")
  end
end
