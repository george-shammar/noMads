class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
    end

    # temporary. remember to move to model
    
    #   method2
    def follow
        @user = User.find(params[:id])
        current_user.followed_users << @user
        redirect_back(fallback_location: user_path(@user))
    end
    #   def unfollow
    #     @user = User.find(params[:id])
    #     current_user.followed_users.find_by(followedid: @user.id).destroy
    #     redirect_back(fallback_location: user_path(@user))
    #   end
end