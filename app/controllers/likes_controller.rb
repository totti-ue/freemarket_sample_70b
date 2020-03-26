class LikesController < ApplicationController
  before_action :set_item, only: [:create, :release]

  def create
    @like = Like.create(user_id: current_user.id, item_id: params[:item_id])
    if @like.save
    else
      flash.now[:alert] = "失敗です。"
      redirect_to item_path(params[:item_id])
    end
  end

  def release
    @item = Item.find(params[:item_id])
    @like = Like.find_by(user_id: current_user.id, item_id: params[:item_id])
    @like.destroy
  end


  private
    def set_item
      @item = Item.find(params[:item_id])
    end
end
