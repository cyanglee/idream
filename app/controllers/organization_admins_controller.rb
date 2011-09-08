class OrganizationAdminsController < ApplicationController
  # GET /organization_admins
  # GET /organization_admins.json
  def index
    #@organization_admins = current_user.organization_admins

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @organization_admins }
    end
  end

  # GET /organization_admins/1
  # GET /organization_admins/1.json
  def show
    #@organization_admin = current_user.organization_admins
    #
    #respond_to do |format|
    #  format.html # show.html.erb
    #  format.json { render json: @organization_admin }
    #end
  end

  # GET /organization_admins/new
  # GET /organization_admins/new.json
  def new
    @organization_admin = OrganizationAdmin.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @organization_admin }
    end
  end

  # GET /organization_admins/1/edit
  def edit
    @organization_admin = OrganizationAdmin.find(params[:id])
  end

  # POST /organization_admins
  # POST /organization_admins.json
  def create
    @organization_admin = OrganizationAdmin.new(params[:organization_admin])
    # set the status to pending
    @organization_admin.status = Settings.status.pending

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

  # PUT /organization_admins/1
  # PUT /organization_admins/1.json
  def update
    @organization_admin = OrganizationAdmin.find(params[:id])

    respond_to do |format|
      if @organization_admin.update_attributes(params[:organization_admin])
        format.html { redirect_to @organization_admin, notice: 'Organization admin was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @organization_admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organization_admins/1
  # DELETE /organization_admins/1.json
  def destroy
    @organization_admin = OrganizationAdmin.find(params[:id])
    @organization_admin.destroy

    respond_to do |format|
      format.html { redirect_to organization_admins_url }
      format.json { head :ok }
    end
  end
end
