class RemovePeriodColumnsFromJobs < ActiveRecord::Migration
  def change
    remove_column :jobs, :hours
    remove_column :jobs, :hours_period
  end
end
