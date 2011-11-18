class AddWebpageToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :webpage, :string
  end
end
