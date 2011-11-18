class AddPeriodToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :period, :string
  end
end
