class Public::RelationshipsController < ApplicationController
  def create
    if current_user.id != params[:user_id].to_i
      current_user.follow(params[:user_id])
    end
    redirect_to request.referer
  end
  
  def destroy
    if current_user.id != params[:user_id].to_i
      current_user.unfollow(params[:user_id])
    end
    redirect_to request.referer
  end

  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end
end
