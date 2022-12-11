class Public::ItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    @item.save
    redirect_to items_path
  end

  def index
    @users = User.all
    @posts = current_user.posts.order(created_at: :desc)
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

    if params[:post][:comment].blank? and  params[:score].blank?
      flash[:notice] = "評価とコメントがされてません"
      render :edit
      return
    end

    if params[:post][:comment].blank?
      flash[:notice] = "コメントがされてません"
      render :edit
      return
    end

    if params[:score].blank?
      star = 0
      flash[:notice] = "評価がされてません"
      render :edit
      return
    else
      star = params[:score]
    end

    if @post.update(post_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :item_id)
  end

  def post_params
    params.require(:post).permit(:comment, :star, :item_id)
  end
end
