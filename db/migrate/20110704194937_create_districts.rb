class CreateDistricts < ActiveRecord::Migration
    def change
        create_table :districts do |t|
            t.string :name
            t.references :city, :null => false
            t.timestamps
        end

        add_index :districts, :name
    end
end
