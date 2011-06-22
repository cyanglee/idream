class CreateJobs < ActiveRecord::Migration
    def change
        create_table :jobs do |t|
            t.integer :user_id
            t.string :name
            t.string :desc
            t.date :start_date
            t.date :end_date
            t.timestamps
        end

        add_index :jobs, :user_id
        add_index :jobs, :name
    end
end
