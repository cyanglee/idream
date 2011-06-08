class Job < ActiveRecord::Base
  attr_accessible :user_id, :name, :desc, :start_date, :end_date
end
