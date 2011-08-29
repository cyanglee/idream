class Organization < ActiveRecord::Base
    has_and_belongs_to_many :users
    has_many :jobs

    accepts_nested_attributes_for :jobs
end