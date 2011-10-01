class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :find_user
  #before_filter :set_locale

  # redirect to the root page if the user doesn't have the permission to acccess that section of the site
  rescue_from CanCan::AccessDenied do |exception|
    # don't provide any information for users who access to the admin section
    if exception.subject == :rails_admin
      redirect_to "/"
    else
      redirect_to "/", :alert => exception.message
    end
  end

  private

  def find_user
    @user = current_user
  end

  #def set_locale
  #  I18n.locale = "zh-TW"
  #end

end
