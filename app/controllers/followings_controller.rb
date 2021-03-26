class FollowingsController < ApplicationController
#    method1
    def create
        user = User.find(params[:followedid])
        current_user.follow(user)
        if following.save
            redirect_to users_path
            flash[:message] = "You are now following #{@followed_user}"
        else
            flash[:alert] = "Following #{@followed_user} attempt was unsuccessful"
        end
    end

    def destroy
        current_user.unfollow(params[:id])
        redirect_to root_path
    end



    # def create
    #     @followed_user = User.find(params[:following][:followed_id])
    #     @following = current_user.follower_relationship.new(followed_id: followed.id)

    #     if following.save
    #         redirect_to root_path
    #         flash[:message] = "You are now following #{@followed_user}"
    #     else
    #         redirect_to root_path
    #         flash[:alert] = "Following #{@followed_user} attempt was unsuccessful"
    #     end
    # end

    # def show
    #     @follower_relationships = current_user.follower_relationships
    #     @followed_relationships = current_user.followed_relationships
    # end

    # def destroy
    #     @following = Following.find(params[:id])
    #     if @following.follower_user == current_user
    #         @following.destroy
    #         flash[message] = "You have unfollowed this user"
    #     end
    #     redirect_to root_path
    # end
end