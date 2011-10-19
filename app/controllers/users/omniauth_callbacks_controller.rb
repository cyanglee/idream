class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # You need to implement the method below in your model
    @user = User.find_for_facebook_oauth(env["omniauth.auth"], current_user)
    if @user.persisted?
      #flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
      #binding.pry
      sign_in_and_redirect @user, :event => :authentication
    else
      #binding.pry
      session["devise.facebook_data"] = env["omniauth.auth"]
      #redirect_to new_user_registration_url
      redirect_to cancel_user_registration_path
    end
  end

  def passthru
    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
  end

  #def after_omniauth_failure_path_for(scope)
  #  cancel_user_registration_path(scope)
  #end
end