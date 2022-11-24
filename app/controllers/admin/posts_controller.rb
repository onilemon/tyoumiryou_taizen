class Admin::PostsController < ApplicationController
  def index
   @users = User.all
  end

  def show
    @posts = User.find(params[:id]).posts
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :item_id)
  end
end
