module ApplicationHelper
      def profile_photo(user)
        if user_signed_in?
          image_tag user.image.variant(resize: "50x50")  if user.image.attached?
        end
      end

      def cover_photo(user)
        image_tag user.coverimage.variant(resize_to_fill: [850, 250, gravity: 'north']) if user.coverimage.attached?
      end

      def navbar_button_name(user)
        link_to user.fullname, edit_user_registration_path, class: "nav-link active"  if user_signed_in?
      end
    
      def navbar_button_home
        link_to 'HOME', root_path, class: "nav-link active"
      end

      def navbar_button_nomads
        link_to 'NOMADS', root_path, class: "nav-link active home"
      end

      def navbar_profile_button
        if user_signed_in?
          link_to 'PROFILE', user_path(current_user), class: "nav-link active"
        end
      end
    
      def navbar_button_sign_out
        link_to 'Sign out', destroy_user_session_path, method: :delete, class: "btn btn-light mx-1 btn-sm" if user_signed_in?
      end

      def navbar_button_edit(user)
        link_to 'Edit profile', edit_user_registration_path, class: "btn btn-light mx-1 btn-sm" if user_signed_in?
      end
    
      def navbar_button_sign_up
        link_to 'Sign up', new_user_registration_path, class: "btn btn-light mx-1 btn-sm" unless user_signed_in?
      end
    
      def navbar_button_log_in
        link_to 'Sign in', new_user_session_path, class: "btn btn-light mx-1 btn-sm" unless user_signed_in?
      end
    
      def user_signed_in?
        !current_user.nil?
      end

      def follower_count(current_user)
        if user_signed_in?
        @follower = Following.where(followedid: current_user)
        @follower.count
        
        end
      end
    
      def following_count(current_user)
        if user_signed_in?
          @following = Following.where(followerid: current_user)
          @following.count
        end
      end

      
end
