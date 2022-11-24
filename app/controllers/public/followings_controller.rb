class Public::FollowingsController < ApplicationController
  def index
    @followings = current_user.followings
  end

  def show
    @following = User.find(params[:id])
    @posts = @following.posts
  end
end
