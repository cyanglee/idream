class OrganizationsController < ApplicationController
  def index
    @organizations = Organization.all
  end

  def show
    @organization = Organization.find(params[:id])
  end

  def new
    @organization = Organization.new
  end

  def create
    if params[:organization][:id].nil?
      @organization = Organization.new(params[:organization]) 

      if @organization.save
         redirect_to @organization, :notice => "Successfully created organization."
      else
         render :action => 'new'
      end
    else
      @organization = Organization.find(params[:organization][:id])
      user_ids = []
      user_ids = @organization.user_ids << current_user.id unless @organization.user_ids.include?(current_user.id)
      if @organization.update_attribute(:user_ids, user_ids)
          redirect_to @organization, :notice => "Successfully updated user."
      else
          render :action => 'new'
      end
    end

  end

  def edit
    @organization = Organization.find(params[:id])
  end

  def update
    @organization = Organization.find(params[:id])
    if @organization.update_attributes(params[:organization])
      redirect_to @organization, :notice  => "Successfully updated organization."
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
