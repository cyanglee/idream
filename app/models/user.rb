class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable,
           :omniauthable

    has_many :jobs
    has_many :reps
    has_many :organizations, :through => :reps
    #has_many :assignments
    #has_many :roles, :through => :assignments, :dependent => :destroy

    #accepts_nested_attributes_for :roles
    # Setup accessible (or protected) attributes for your model
    # attr_accessible only allows the specified fileds to be created through mass assignment, while attr_protected works the other way around.
    # attr_accessor is used when you want to use a field in the controller or view which is not a field in the db.
    #attr_accessible :email, :password, :password_confirmation, :remember_me, :role_ids
    attr_protected :admin

    def has_role?(user, role_sym)
        user.id.nil? ? false : User.where(:id => user.id, role_sym => 1).any?
    end

    def self.role_list
        @role_list = []
        for role in Role.all
            @role_list << role if role.name != 'Admin'
        end
        return @role_list
    end

    def self.user_roles(user)
        return user.roles.reduce([]) { |result, element| result << element.name }.join(", ")
    end
end

# == Schema Information
#
# Table name: users
#
#  id                     :integer(4)      not null, primary key
#  first_name             :string(255)
#  last_name              :string(255)
#  phone_number           :string(255)
#  birth_day              :integer(4)
#  birth_month            :integer(4)
#  birth_year             :integer(4)
#  zip_code               :string(255)
#  volunteer              :boolean(1)
#  org                    :boolean(1)
#  admin                  :boolean(1)
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(128)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer(4)      default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#

