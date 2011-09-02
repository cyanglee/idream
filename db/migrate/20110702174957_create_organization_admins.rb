class CreateOrganizationAdmins < ActiveRecord::Migration
  def change
    create_table :organization_admins, :id => false do |t|
      t.integer :user_id, :null => false
      t.integer :job_id, :null => false
      t.string :status
      t.timestamps
    end
    add_index :organization_admins, :user_id
    add_index :organization_admins, :job_id
    add_index :organization_admins, [:user_id, :job_id], :unique => true
  end
end
