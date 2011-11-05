class OrganizationAdminsController < ApplicationController
  load_and_authorize_resource
  before_filter :find_organization_admins#, :only => [:show, :new, :create]

  def new
    puts "new"
    @organization_admin = OrganizationAdmin.new
    @organizations = Organization.eligible_for_user(current_user)
  end

  def show
    puts "show"
    #if @organization_admins.empty?
    #  redirect_to new_user_organization_admins_path
    #else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @organization_admins }
      end
    #end
  end

  def create
    puts "show"
    organization_admin = current_user.organization_admins.build(params[:organization_admin])
    if organization_admin.save
      render :action => 'show', :flash => { :success => t("ui.school.add")}
    else
      render :action => 'new'
    end
  end

  def destroy
    puts "destroy"
    @organization_admin = OrganizationAdmin.find(params[:id])
    if @organization_admin.destroy
      redirect_to user_organization_admins_path(current_user), :flash => { :success => t("ui.school.delete")}
    else
      render :action => 'new'
    end
  end

  def find_organization_admins
    @organization_admins = current_user.organization_admins
  end
end


