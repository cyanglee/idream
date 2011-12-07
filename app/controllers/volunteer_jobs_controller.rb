class VolunteerJobsController < ApplicationController

  def new
    @volunteer_job = VolunteerJob.new
  end

  def create
    if current_user.nil?
      redirect_to new_user_session_path
    else
      volunteer_job = current_user.volunteer_jobs.build(params[:job])
      if volunteer_job.save
        render :action => 'show', :flash => { :success => t("ui.job.successfully_applied")}
      else
        render :action => 'new'
      end
    end
  end

  def show
    @volunteer_jobs = current_user.volunteer_jobs
    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @volunteer_jobs }
    end
  end

  def destroy
    @volunteer_job = VolunteerJob.find(params[:id])
    if @volunteer_job.destroy
      redirect_to user_volunteer_jobs_path(current_user), :flash => { :success => t("ui.job.successfully_cancelled")}
    else
      render :action => 'show'
    end

  end
end