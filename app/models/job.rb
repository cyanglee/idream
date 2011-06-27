class Job < ActiveRecord::Base
  attr_accessible :name, :desc, :start_date, :end_date
  belongs_to :user
  before_save :getUserIdFromSession
  
  private   

  def getUserIdFromSession
      #puts 
      #self.user_id = @current_user.id    
  end
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

