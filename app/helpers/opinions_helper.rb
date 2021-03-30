# rubocop:disable Style/GuardClause
module OpinionsHelper
  def like_or_dislike_btn(opinion)
    like = Like.find_by(opinion: opinion, user: current_user)
    if like
      link_to('Likes!', opinion_like_path(id: like.id, opinion_id: opinion.id),
              method: :delete, class: 'text-decoration-none color-grey')
    else
      link_to('Likes!', opinion_likes_path(opinion_id: opinion.id), method: :post,
                                                                    class: 'text-decoration-none color-grey')
    end
  end

  def edit_icon(opinion)
    link_to 'edit', edit_opinion_path(opinion), class: 'text-decoration-none' unless current_user != @user
  end

  def trash_icon(opinion)
    unless current_user != @user
      link_to 'delete', opinion, method: :delete, data: { confirm: 'Are you sure you want to delete this tweet?' }
    end
  end

  def who_to_follow_fullname(user)
    user.fullname if !current_user.followed_users.include?(user) and current_user != user
  end

  def who_to_follow_photo(user)
    profile_photo(user) if !current_user.followed_users.include?(user) and current_user != user
  end

  def who_to_follow_button(user)
    if !current_user.followed_users.include?(user) and current_user != user
      button_to 'Follow', follow_user_path(user.id), method: 'POST', class: 'btn btn-primary btn-sm align-self-end'
    end
  end
end
# rubocop:enable Style/GuardClause
