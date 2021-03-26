module UsersHelper

    def profile_show(user)
        if user_signed_in?
        image_tag user.image.variant(resize: "70x70"), class: "cover"  if user.image.attached?
        end
    end

    def opinion_count(user)
        if user_signed_in?
        @opinion = Opinion.where(authorid: user)
        @opinion.count
        end
    end

    def follow_unfollow_button
        if @user.id == current_user.id
            link_to "Sign_out", '/logout', method: :post
        elsif
            current_user.followed_users.include?(@user)
            link_to "Unfollow", following_path(@user), method: :delete, class: "btn btn-primary" if current_user.following?(@user)
        else
            link_to "Follow", follow_user_path, method: "POST", class: "btn btn-primary"
        end
    end
    

end