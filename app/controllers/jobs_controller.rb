class JobsController < ApplicationController
  load_and_authorize_resource
  #before_filter :authenticate_user!, :except => [:show, :index]

  def manage
    @jobs = Job.find_all_by_user_id(current_user.id)
  end

  def index
    @jobs = Job.all
  end

  def show
    @volunteer_job = VolunteerJob.new
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = current_user.jobs.build(params[:job])
    if @job.save
      redirect_to @job, :notice => I18n.t("ui.job.successfully_added")
    else
      render :action => 'new'
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update_attributes(params[:job])
      redirect_to @job, :notice => I18n.t("ui.job.successfully_updated")
    else
      render :action => 'edit'
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to jobs_url, :notice => I18n.t("ui.job.successfully_destroyed")
  end
end
