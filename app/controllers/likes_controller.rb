class LikesController < ApplicationController
  def create
    @like = current_user.likes.new(opinion_id: params[:opinion_id])

    if @like.save
      redirect_to opinions_path, notice: 'You liked an opinion.'
    else
      redirect_to opinions_path, alert: 'You cannot like this opinion.'
    end
  end

  def destroy
    like = Like.find_by(id: params[:id], user: current_user, opinion_id: params[:opinion_id])
    if like
      like.destroy
      redirect_to opinions_path, notice: 'You disliked an opinion.'
    else
      redirect_to opinions_path, alert: 'You cannot dislike an opinion that you did not like before.'
    end
  end

  private

  def like_params
    params.require(:like).permit(:opinion_id, :user_id)
  end
end
