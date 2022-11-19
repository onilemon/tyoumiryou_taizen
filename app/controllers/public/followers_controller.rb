class Public::FollowersController < ApplicationController
  def index
    @followers = current_user.followers
  end
end
