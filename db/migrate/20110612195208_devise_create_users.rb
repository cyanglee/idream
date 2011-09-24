class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.integer :birth_year
      t.string :zip_code
      t.boolean :volunteer
      t.boolean :organization
      t.boolean :admin
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable
      t.confirmable
      # t.encryptable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable
      t.timestamps
    end

    add_index :users, :username, :unique => true
    add_index :users, :email, :unique => true
    add_index :users, :reset_password_token, :unique => true
    add_index :users, :confirmation_token,   :unique => true
    add_index :users, :volunteer
    add_index :users, :organization
    add_index :users, :admin

    # add_index :users, :authentication_token, :unique => true
    # add_index :users, :unlock_token,         :unique => true
  end
end
