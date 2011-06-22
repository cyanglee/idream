class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable,
           :omniauthable

    has_many :jobs
    has_many :assignments
    has_many :roles, :through => :assignments, :dependent => :destroy

    accepts_nested_attributes_for :roles
    # Setup accessible (or protected) attributes for your model
    attr_accessible :email, :password, :password_confirmation, :remember_me, :role_ids

    def has_role?(role_sym)
        roles.any? { |r| r.name.underscore.to_sym == role_sym }
    end

    def self.role_list
        @role_list = []
        for role in Role.all
            @role_list << role if role.name != 'Admin'
        end
        return @role_list
    end
    
    def self.user_roles(user)
        return user.roles.reduce([]) {|result, element| result << element.name}.join(", ")
    end
end
