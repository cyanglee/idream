class CreateOrganizationsAdmins < ActiveRecord::Migration
    def change
        create_table :organizations_admins, :id => false do |t|
            t.references :organization, :null => false
            t.references :user, :null => false
        end
    end
end
