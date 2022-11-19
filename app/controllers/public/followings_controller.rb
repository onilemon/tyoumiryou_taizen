class Public::FollowingsController < ApplicationController
  def index
    @followings = current_user.followings
  end
end
