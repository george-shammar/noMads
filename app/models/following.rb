class Following < ApplicationRecord
    belongs_to :follower_user, class_name: 'User', foreign_key: 'followerid'
    belongs_to :followed_user, class_name: 'User', foreign_key: 'followedid'

    
end

