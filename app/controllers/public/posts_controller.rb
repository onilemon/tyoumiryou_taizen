class Public::PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new(item_id: params[:item_id])
    @item = Item.find(params[:item_id])
  end

  def create
    @post = current_user.posts.new(post_params)
    @item = Item.find(params[:post][:item_id])
    if params[:post][:comment].blank? and  params[:score].blank?
      flash[:notice] = "評価とコメントがされてません"
      render :new
      return
    elsif params[:post][:comment].blank?
      flash[:notice] = "コメントがされてません"
      render :new
      return
    elsif params[:score].blank?
      star = 0
      flash[:notice] = "評価がされてません"
      render :new
      return
    else
      star = params[:score]
    end

    post_data = current_user.posts.find_by(item_id: @post.item_id)

    if post_data.nil?
      @post.star = star
      unless @post.save
        render :new
      end
    else
      post_data.star = params[:score]
      unless post_data.update(post_params)
        render :new
      end
    end
    Attention.find_by(item_id: @post.item_id)&.destroy
    redirect_to items_path
  end

  def index
    @items = Item.joins(:posts).group(:id).order("AVG(posts.star) desc")
  end

  def show
    @item = Item.find(params[:id])
    @posts = Item.find(params[:id]).posts
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to items_path
  end

private

  def post_params
    params.require(:post).permit(:comment, :star, :item_id)
  end
end
