class FollowingsController < ApplicationController
    def new
    end

    def create
        @followed_user = User.find(params[:following][:followed_id])
        @following = current_user.follower_relationship.new(followed_id: followed.id)

        if following.save
            redirect_to root_path
            flash[:message] = "You are now following #{@followed_user}"
        else
            redirect_to root_path
            flash[:alert] = "Your following attempt was unsuccessful"
        end
    end

    def show
        @follower_relationships = current_user.follower_relationships
        @followed_relationships = current_user.followed_relationships
    end

    def destroy
    end
end