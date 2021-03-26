module OpinionsHelper
    def like_or_dislike_btn(opinion)
        like = Like.find_by(opinion: opinion, user: current_user)
        if like
          link_to('Likes!', opinion_like_path(id: like.id, opinion_id: opinion.id), method: :delete, class: "text-decoration-none color-grey")
        else
          link_to('Likes!', opinion_likes_path(opinion_id: opinion.id), method: :post, class: "text-decoration-none color-grey")
        end
    end

    def icon
      if current_user == opinion.author 
      end
    end
end
