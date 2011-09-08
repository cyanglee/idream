class OrganizationAdmin < ActiveRecord::Base
    belongs_to :organization
    belongs_to :user

    validates_uniqueness_of :user_id, :scope => :organization_id,
    											  :message => "has already associated with the organization"   					  
end