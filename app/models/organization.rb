class Organization < ActiveRecord::Base

  #has_and_belongs_to_many :users
  has_many :organization_admins
  has_many :users, :through => :organization_admins, :dependent => :destroy
  has_many :jobs

  scope :order_by_name, order("name")
  scope :active, where(:active => true).order_by_name
  scope :active_by_name, active.order_by_name

  def self.eligible_for_user(user)
    ids_to_exclude = user.organization_ids
    org_table = Arel::Table.new(:organizations)
    if ids_to_exclude.empty? then self.active_by_name else self.where(org_table[:id].not_in ids_to_exclude).active_by_name end
  end

end