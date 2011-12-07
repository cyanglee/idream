class CreateVolunteerJobs < ActiveRecord::Migration
  def change
    create_table :volunteer_jobs do |t|
      t.integer :user_id, :null => false
      t.integer :job_id, :null => false
      t.string :status, :default => Settings.status.pending, :null => false
      t.timestamps
    end
    add_index :volunteer_jobs, :user_id
    add_index :volunteer_jobs, :job_id
    add_index :volunteer_jobs, [:user_id, :job_id], :unique => true
  end
end
