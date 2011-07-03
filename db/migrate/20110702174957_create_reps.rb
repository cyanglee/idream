class CreateReps < ActiveRecord::Migration
    def change
        create_table :reps do |t|
            t.integer :user_id
            t.integer :organization_id

            t.timestamps
        end

        add_index :reps, :user_id
        add_index :reps, :organization_id
    end
end
