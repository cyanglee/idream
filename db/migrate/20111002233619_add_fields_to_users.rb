class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :degree, :string
    add_column :users, :skills, :text
  end
end
