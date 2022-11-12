class Public::AttentiousController < ApplicationController
  before_action :authenticate_user!

  def attention
    item_attention_paramas["item_ids"].each do |item_id|
    current_user.attentions.find_or_create_by(item_id: item_id)
    end
    redirect_to items_path
  end

  private

  def item_attention_paramas
    params.permit(item_ids: [])
  end
end
