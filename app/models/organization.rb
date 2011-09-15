class Organization < ActiveRecord::Base

  #has_and_belongs_to_many :users
  has_many :organization_admins
  has_many :users, :through => :organization_admins, :dependent => :destroy
  has_many :jobs

  default_scope order("name")

  def self.eligible_for_user(user)
    ids_to_exclude = user.organization_ids
    org_table = Arel::Table.new(:organizations)

    self.where(org_table[:id].not_in ids_to_exclude)
  end

end