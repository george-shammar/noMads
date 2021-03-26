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

end