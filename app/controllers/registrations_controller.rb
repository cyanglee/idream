class RegistrationsController < Devise::RegistrationsController
    def after_sign_up_path_for(resource)
        if resource.organization == true
            new_organization_path
        else
            super
        end
    end
end