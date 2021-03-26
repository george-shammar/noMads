# rubocop:disable Style/GuardClause
module UsersHelper
  def profile_show(user)
    image_tag user.image.variant(resize: '70x70'), class: 'cover' if user_signed_in? && user.image.attached?
  end

  def opinion_count(user)
    if user_signed_in?
      @opinion = Opinion.where(authorid: user)
      @opinion.count
    end
  end

  def follow_unfollow_button
    if @user.id == current_user.id
      link_to 'Sign_out', '/logout', method: :post
    elsif current_user.followed_users.include?(@user)
      if current_user.following?(@user)
        link_to 'Unfollow', following_path(@user), method: :delete,
                                                   class: 'btn btn-primary'
      end
    else
      link_to 'Follow', follow_user_path, method: 'POST', class: 'btn btn-primary'
    end
  end
end
# rubocop:enable Style/GuardClause
