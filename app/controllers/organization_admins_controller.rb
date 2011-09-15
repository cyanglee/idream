class OrganizationAdminsController < ApplicationController

  before_filter :find_organization_admins, :only => [:show]

  def index
    #@organization_admin = OrganizationAdmin.all

  end

  def new
    @organization_admin = OrganizationAdmin.new
  end

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @organization_admins }
    end
  end

  def create
    @organization_admin = current_user.organization_admins.build(params[:organization_admin])
        #OrganizationAdmin.new(params[:organization_admin])
    respond_to do |format|
      if @organization_admin.save
        format.html { redirect_to @organization_admin, notice: 'Organization admin was successfully created.' }
        format.json { render json: @organization_admin, status: :created, location: @organization_admin }
      else
        format.html { render action: "new" }
        format.json { render json: @organization_admin.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @organization_admin = OrganizationAdmin.find(params[:id])
    @organization_admin.destroy

    respond_to do |format|
      format.html { redirect_to user_organization_admins_path(current_user) }
      format.json { head :ok }
    end
  end

  def find_organization_admins
    @organization_admins = @user.organization_admins
  end
end


