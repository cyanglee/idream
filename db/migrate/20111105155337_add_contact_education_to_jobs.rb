class AddContactEducationToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :education, :string
  end
end
