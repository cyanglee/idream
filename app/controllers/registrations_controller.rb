class RegistrationsController < Devise::RegistrationsController

  def after_sign_up_path_for(resource)
  end

  #def after_inactive_sign_up_path_for(resource)
  #  if !resource.confirmed? and inactive_reason(resource) == "unconfirmed"
  #    #render "users/confirmations/confirmation"
  #    pages_confirmation_path
  #  else
  #    root_path
  #  end
  #end
end