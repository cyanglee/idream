class UsersController < ApplicationController
    load_and_authorize_resource
    skip_authorize_resource :only => :edit
    before_filter :find_user, :only => [:show, :update]
    before_filter :filter_roles, :only => [:show, :edit, :update]

    #before_filter :authenticate_user!#, :except => [:show, :index]

    def index
        @users = User.all
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        if @user.update_attributes(params[:user])
            redirect_to @user, :notice => "Successfully updated user."
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