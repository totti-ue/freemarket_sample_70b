class ItemsController < ApplicationController

  def index
    @items = Item.includes(:images).order('created_at DESC')
  end

  def new
    @item = Item.new
    @item.images.new
  end
  
  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:title, :text, :category_id, :brand_id, :status, :delivery_charge, :delivery_origin, :delivery_size, :delivery_method, :delivery_days, :price, images_attributes: [:image]).merge(seller_id: current_user.id)
  end

end
