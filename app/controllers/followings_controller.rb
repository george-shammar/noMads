class FollowingsController < ApplicationController

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


    private

    def following_params
        params.require(:following).permit(:followerid, :followedid)
    end
end