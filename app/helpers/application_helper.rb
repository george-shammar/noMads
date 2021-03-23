module ApplicationHelper

      def navbar_button_name(user)
        link_to user.fullname, edit_user_registration_path  if user_signed_in?
      end
    
      def navbar_button_home
        link_to 'noMads', root_path
      end
    
      def navbar_button_sign_out
        link_to 'Sign out', destroy_user_session_path, method: :delete, class: "btn btn-light mx-1 btn-sm" if user_signed_in?
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
end
