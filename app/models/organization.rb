class Organization < ActiveRecord::Base
    has_many :users, :through => :reps
end