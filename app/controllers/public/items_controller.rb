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
    @attentions = Attention.all
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
    @posts = current_user.posts
    @post = Post.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :item_id)
  end
end
