class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  #accepts_nested_attributes_for :roles
  # Setup accessible (or protected) attributes for your model
  # attr_accessible only allows the specified fileds to be created through mass assignment, while attr_protected works the opposite way.
  # attr_accessor is used when you want to use a field in the controller or view which is not a field in the db.
  # If attr_accessible or attr_protected is not specified, all fields are open for mass assignment
  #attr_accessible :email, :password, :password_confirmation, :remember_me, :role_ids
  attr_protected :admin

  # the scope will return all the users based on the given criteria. e.g. User.admin would return an array of all the site admins.
  # The main reason scopes are better than plain class methods is that they can be chained with other methods, so that, e.g.
  # User.admin.paginate(:page => 1)
  scope :admin, where(:admin => true)
  scope :org_admin, where(:organization => true)
  scope :volunteer, where(:volunteer => true)

  #has_and_belongs_to_many :organizations

  has_many :jobs
  has_many :volunteers
  has_many :jobs, :through => :volunteers, :dependent => :destroy
  has_many :organization_admins
  has_many :organizations, :through => :organization_admins, :dependent => :destroy

  def has_role?(user, role)
    user.id.nil? ? false : User.where(:id => user.id, role => true).any?
  end
    
  #
  #def self.user_roles(user)
  #  return user.roles.reduce([]) { |result, element| result << element.name }.join(", ")
  #end
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

