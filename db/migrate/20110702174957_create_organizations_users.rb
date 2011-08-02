class CreateOrganizationsUsers < ActiveRecord::Migration
    def change
        create_table :organizations_users, :id => false do |t|
            t.references :organization, :null => false
            t.references :user, :null => false
        end
    end
end
