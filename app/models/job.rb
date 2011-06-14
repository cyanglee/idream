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
