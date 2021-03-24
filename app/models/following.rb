class Following < ApplicationRecord
    belongs_to :follower_user, class_name: 'User', foreign_key: 'followerid'
    belongs_to :followed_user, class_name: 'User', foreign_key: 'followedid'


    def follower_count(current_user)
        @follower_count = Following.where(followedid: current_user.id).count
    end

    def following_count(current_user)
        @following_count = Following.where(followerid: current_user.id).count
    end
end

