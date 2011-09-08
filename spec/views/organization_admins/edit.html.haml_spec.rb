require 'spec_helper'

describe "organization_admins/edit.html.haml" do
  before(:each) do
    @organization_admin = assign(:organization_admin, stub_model(OrganizationAdmin))
  end

  it "renders the edit organization_admin form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => organization_admins_path(@organization_admin), :method => "post" do
    end
  end
end
