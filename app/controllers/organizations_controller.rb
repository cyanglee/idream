class OrganizationsController < ApplicationController
  load_and_authorize_resource

  def index
    @organizations = Organization.all
  end

  def show
    @organization = Organization.find(params[:id])
  end

  def my
    @user = current_user.organization_admins
  end

  def new
    @organization = Organization.new
  end

  def create
    # this is to handle the case when the user creates a new organization
    if params[:organization][:id].nil?
      @organization = Organization.new(params[:organization]) 

      if @organization.save
         redirect_to @organization, :notice => "Successfully created organization."
      else
         render :action => 'new'
      end
    # this is to associate the user with an existing organization
    else
      #@org = Organization.find(params[:organization][:id])
      #@new_org_admin = @org.organization_admins.build(:user_id => current_user.id, :organization_id => @org.id, :status => Settings.status.pending)
      #if @new_org_admin.save
      #    redirect_to my_organizations_path, :notice => "Successfully associated user."
      #else
      #    render :action => 'new'
      #end
    end

  end

  def edit
    @organization = Organization.find(params[:id])
  end

  def update
    @organization = Organization.find(params[:id])
    if @organization.update_attributes(params[:organization])
      redirect_to user_organization_admins_path(current_user), :flash => {:success => t("ui.school.successfully_updated")}
    else
      render :action => 'edit'
    end
  end

  def destroy
    @organization = Organization.find(params[:id])
    @organization.destroy
    redirect_to organizations_url, :notice => "Successfully destroyed organization."
  end
end
