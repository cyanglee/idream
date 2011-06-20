class AddAdminColumnToUser < ActiveRecord::Migration
    def change
        add_column :users, :name, :string
        add_column :users, :admin, :tinyint
    end
end
