class CreateVolunteers < ActiveRecord::Migration
  def change
    create_table :volunteers do |t|
      t.integer :user_id, :null => false
      t.integer :job_id, :null => false
      t.timestamps
    end
    add_index :volunteers, :user_id
    add_index :volunteers, :job_id
    add_index :volunteers, [:user_id, :job_id], :unique => true
  end
end
