class Job < ActiveRecord::Base
  belongs_to :user
  belongs_to :organization

  has_many :volunteers
  has_many :users, :through => :volunteers
end
# == Schema Information
#
# Table name: jobs
#
#  id              :integer(4)      not null, primary key
#  user_id         :integer(4)
#  organization_id :integer(4)
#  title           :string(255)
#  desc            :text
#  location        :text
#  requirement     :text
#  contact         :string(255)
#  hours           :integer(4)
#  hours_period    :string(255)
#  begin_date      :date
#  end_date        :date
#  begin_time      :time
#  end_time        :time
#  created_at      :datetime
#  updated_at      :datetime
#

