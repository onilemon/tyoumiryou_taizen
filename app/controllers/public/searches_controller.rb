class Public::SearchesController < ApplicationController
  def search
    @items = Item.all
    if params[:genre_id].present?
      @items = @items.where(genre_id: params[:genre_id])
    elsif params[:keyword].present?
      @items = @items.where("name like ?", "%#{params[:keyword]}%")
    end
  end
end