class UsersController < ApplicationController
  load_and_authorize_resource
  #skip_authorize_resource :only => [:edit, :update]
  before_filter :find_user, :only => [:show, :edit, :update]
  #before_filter :filter_roles, :only => [:show, :edit, :update]

  #before_filter :authenticate_user!#, :except => [:show, :index]

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    target_user = params[:user]
    # This is to handle the situation where the admin has the ability to update the a user's profile,
    # and the logic below will determine which user object to use
    # TODO: figure out if there is a better way than using find_by_email to increase the performance
    user_to_update = if !target_user[:email].nil? and @user.email != target_user[:email] then User.find_by_email(target_user[:email]) else @user end
    if user_to_update.update_attributes(params[:user])
      # This is related to issue #5. Devise logs off the login user after the password change.
      # This makes the User object null and that's why the Cancan error message comes out.
      # The solution is to sign in the user again before the redirect.
      sign_in(user_to_update, :bypass => true)
      redirect_to edit_user_path(user_to_update), :notice => t("message.user.successfully_updated")
    else
      render :action => 'edit'
    end
  end

  private

  def find_user
    @user = User.find(current_user.id)
  end

end

