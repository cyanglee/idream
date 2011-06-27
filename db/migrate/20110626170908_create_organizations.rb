class CreateOrganizations < ActiveRecord::Migration
    def change
        create_table :organizations do |t|
            t.string :name
            t.text :profile
            t.string :address
            t.string :district
            t.string :city
            t.string :zipcode
            t.string :category
            t.string :contact
            t.integer :creator
            t.timestamps
        end

        add_index :organizations, :name
        add_index :organizations, :contact
        add_index :organizations, :creator
    end
end
