class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @opinion = Opinion.new
  end

  def follow
    @user = User.find(params[:id])
    current_user.followed_users << @user
    redirect_back(fallback_location: user_path(@user))
  end
end
