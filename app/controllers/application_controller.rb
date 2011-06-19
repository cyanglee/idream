class ApplicationController < ActionController::Base
    protect_from_forgery

    # redirect to the root page if the user doesn't have the permission to acccess that section of the site
    rescue_from CanCan::AccessDenied do |exception|
        redirect_to root_url, :alert => exception.message
    end
end
