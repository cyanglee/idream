class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  #accepts_nested_attributes_for :roles
  # Setup accessible (or protected) attributes for your model
  # attr_accessible only allows the specified fileds to be created through mass assignment, while attr_protected works the opposite way.
  # attr_accessor is used when you want to use a field in the controller or view which is not a field in the db.
  # If attr_accessible or attr_protected is not specified, all fields are open for mass assignment
  #attr_accessible :email, :password, :password_confirmation, :remember_me, :role_ids
  attr_protected :admin
  attr_writer :full_name

  # the scope will return all the users based on the given criteria. e.g. User.admin would return an array of all the site admins.
  # The main reason scopes are better than plain class methods is that they can be chained with other methods, so that, e.g.
  # User.admin.paginate(:page => 1)
  scope :admin, where(:admin => true)
  scope :org_admin, where(:organization => true)
  scope :volunteer, where(:volunteer => true)

  #has_and_belongs_to_many :organizations

  has_many :jobs
  has_many :volunteer_jobs
  has_many :jobs, :through => :volunteer_jobs, :dependent => :destroy
  has_many :organization_admins
  has_many :organizations, :through => :organization_admins, :dependent => :destroy

  #validates_format_of :home_phone,
  #    :message => I18n.t("message.user.wrong_phone_number"),
  #    :with => /^\d{2,3}-\d{3,4}-\d{4}$/
  #validates_format_of :cell_phone,
  #    :message => I18n.t("message.user.wrong_phone_number"),
  #    :with => /^\d{10}$/


  def has_role?(user, role)
    user.id.nil? ? false : User.where(:id => user.id, role => true).any?
  end

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token['extra']['user_hash']

    if user.email == User.find_by_email(data["email"]).email
      user
    else
      birth_year = if data['birthday'].nil? or data['birthday'].empty? then "" else data['birthday'].split("/").last end
      education = if data['education'].last["type"].nil? or data['education'].last["type"].empty? then "" else data['education'].last["type"] end

      # Create a user with a stub password.
      User.create(:email => data["email"],
                  :password => Devise.friendly_token[0, 20],
                  :volunteer => 1,
                  :gender => Translator.new(data["gender"]).gender,
                  :birth_year => birth_year,
                  :degree => Translator.new(education).education,
                  :confirmation_token => nil,
                  :confirmed_at => Time.now)
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["user_hash"]
        user.email = data["email"]
      end
    end
  end

  def full_name
    [first_name, last_name].join(' ')
  end

  private

  #
  #def self.user_roles(user)
  #  return user.roles.reduce([]) { |result, element| result << element.name }.join(", ")
  #end
end