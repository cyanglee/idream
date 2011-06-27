class CreateJobs < ActiveRecord::Migration
    def change
        create_table :jobs do |t|
            t.integer :user_id
            t.integer :organization_id
            t.string :title
            t.text :desc
            t.text :location
            t.text :requirement
            t.string :contact
            t.integer :hours
            t.string :hours_period
            t.date :begin_date
            t.date :end_date
            t.time :begin_time
            t.time :end_time
            t.timestamps
        end

        add_index :jobs, :user_id
        add_index :jobs, :organization_id
        add_index :jobs, :title
    end
end
