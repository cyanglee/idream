class AddStatusToVolunteerJobs < ActiveRecord::Migration
  def change
    add_column :volunteer_jobs, :status, :string
  end
end
