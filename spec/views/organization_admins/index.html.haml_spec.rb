require 'spec_helper'

describe "organization_admins/index.html.haml" do
  before(:each) do
    assign(:organization_admins, [
      stub_model(OrganizationAdmin),
      stub_model(OrganizationAdmin)
    ])
  end

  it "renders a list of organization_admins" do
    render
  end
end
