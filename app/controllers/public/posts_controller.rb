class Public::PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new(item_id: params[:item_id])
    @item = Item.find(params[:item_id])
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.star = params[:score]
    if @post.save
      Attention.find_by(item_id: @post.item_id)&.destroy
      redirect_to items_path
    else
      render :new
    end
  end

  def index
    all_items = Item.all
    @items = Post.group(:item_id).average(:star).map do |k, v|
      item = all_items.find_by(id: k)
      item.average = v.to_f.round(1)
      item
    end
    @items = @items.sort_by{|o| o.average }.reverse
  end

  def show
    @item = Item.find(params[:id])
    @posts = Item.find(params[:id]).posts
  end

private
  def post_params
    params.require(:post).permit(:comment, :star, :item_id)
  end
end
