class Public::ItemsController < ApplicationController

  def index
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
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id)
  end
end
