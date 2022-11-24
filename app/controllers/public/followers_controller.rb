class Public::FollowersController < ApplicationController
  def index
    @followers = current_user.followers
  end

  def show
    @following = User.find(params[:id])
    @posts = @following.posts
  end
end
