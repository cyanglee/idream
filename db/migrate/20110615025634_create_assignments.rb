class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :user_id
      t.index :user_id
      t.integer :role_id
      t.index :role_id

      t.timestamps
    end
  end
end
