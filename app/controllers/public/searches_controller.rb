class Public::SearchesController < ApplicationController
  def search
    @items = Item.all
    if params[:genre_id].present?
      @items = @items.where(genre_id: params[:genre_id])
    end
    if params[:keyword].present?
      @items = @items.where("name like ?", "%#{params[:keyword]}%")
    end
  end
end