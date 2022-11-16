class Public::ItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    @item.save
    redirect_to items_path
  end

  def index
    @posts = current_user.posts
    @attentions = current_user.attentions
    @user = current_user
    @items = Item.all
    if params[:genre_id].present?
      @items = @items.where(genre_id: params[:genre_id])
      @items.each do |item|
        current_user.attentions.find_or_create_by(item: item)
      end
    end
    if params[:keyword].present?
      @items = @items.where("name like ?", "%#{params[:keyword]}%")
      @items.each do |item|
        current_user.attentions.find_or_create_by(item: item)
      end
    end
  end

  def show
    @item = Item.find(params[:id])
    @post = current_user.posts.find_by(item_id: @item.id)
  end

  def edit
     @item = Item.find(params[:id])
     @post = current_user.posts.find_by(item_id: @item.id)
  end

  def update
    @item = Item.find(params[:id])
    @post = current_user.posts.find_by(item_id: @item.id)
    @post.star = params[:score]
    if @post.update(post_params)
      redirect_to item_path(@item.id)
    else
      render edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :item_id)
  end

  def post_params
    params.require(:post).permit(:comment, :star, :item_id)
  end
end
