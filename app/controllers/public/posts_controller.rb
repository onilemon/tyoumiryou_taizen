class Public::PostsController < ApplicationController
  def new
    @post =Post.new
  end
  
  def create
  @post = Post.new(post_params)
  @post.save
  redirect_to items_path
end

private
  def post_params
    params.require(:post).permit(:comment, :star)
  end
end
