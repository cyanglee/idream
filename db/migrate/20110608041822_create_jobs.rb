class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :user_id
      t.string :name
      t.string :desc
      t.datetime :start_date
      t.datetime :end_date
      t.timestamps
    end
  end
end
