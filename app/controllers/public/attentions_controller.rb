class Public::AttentionsController < ApplicationController
  before_action :authenticate_user!

  def attention
    if item_attention_paramas["item_ids"].blank?
      redirect_to request.referer, notice: "チェックしてください"
    else
      item_attention_paramas["item_ids"].each do |item_id|
      current_user.attentions.find_or_create_by(item_id: item_id)
    end
      redirect_to items_path
    end
  end

  def destroy
    item = Item.find(params[:item_id])
    user_attentions = current_user.attentions.find_by(item_id: item.id)
    user_attentions.destroy
    redirect_to items_path
  end

  private

  def item_attention_paramas
    params.permit(item_ids: [])
  end
end
