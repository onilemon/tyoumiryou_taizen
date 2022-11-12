class Public::PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new(item_id: params[:item_id])
    @item = Item.find(params[:item_id])
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.save
    redirect_to items_path
  end

private
  def post_params
    params.require(:post).permit(:comment, :star, :item_id)
  end
end
