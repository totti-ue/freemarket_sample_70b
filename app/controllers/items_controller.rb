class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
  end
  
  def create
    Item.create(item_params)
    redirect_to action: :index
  end

  private
  def item_params
    params.require(:item).permit(:title, :text, :category_id, :brand_id, :status, :delivery_charge_id, :delivery_origin, :delivery_size, :delivery_method_id, :delivery_days, :price).merge(seller_id: current_user.id)
  end

end
