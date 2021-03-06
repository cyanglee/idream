class CreateOrganizationAdmins < ActiveRecord::Migration
  def change
    create_table :organization_admins do |t|
      t.integer :user_id, :null => false
      t.integer :organization_id, :null => false
      t.string :status, :default => Settings.status.pending, :null => false
      t.timestamps
    end
    add_index :organization_admins, :user_id
    add_index :organization_admins, :organization_id
    add_index :organization_admins, [:user_id, :organization_id], :unique => true
  end
end
