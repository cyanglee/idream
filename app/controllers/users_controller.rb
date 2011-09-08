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
    user_to_update = @user.email != target_user[:email] ? User.find_by_email(target_user[:email]) : @user

    if user_to_update.update_attributes(params[:user])
      redirect_to user_to_update, :notice => "Successfully updated user."
    else
      render :action => 'edit'
    end
  end

  private

  def find_user
    @user = User.find(current_user.id)
  end

  def filter_roles
    @filtered_roles = []
    for role in Role.all
      if can? :manage, @role
        @filtered_roles << role
      else
        @filtered_roles << role if role.name != 'Admin'
      end
    end
  end
end

