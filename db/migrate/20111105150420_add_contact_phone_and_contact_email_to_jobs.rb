class AddContactPhoneAndContactEmailToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :contact_phone, :string
    add_column :jobs, :contact_email, :string
  end
end
