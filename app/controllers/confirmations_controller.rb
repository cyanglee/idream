class ConfirmationsController < Devise::ConfirmationsController

  # this is an override method
  def after_confirmation_path_for(resource_name, resource)
    if resource.organization
      user_organization_admins_path(current_user)
    else
      root_path
    end

  end

end