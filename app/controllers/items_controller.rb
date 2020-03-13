class ItemsController < ApplicationController
  before_action :et_item, except: [:index, :new, :create]

  def index
    @items = Item.includes(:images).order('created_at DESC').limit(3)
    @items_old = Item.includes(:images).order('created_at ASC').limit(3)
  end

  def new
    @item = Item.new
    @item.images.new
  end
  
  def create
    binding.pry
    @item = Item.create(item_params)
    if @item.save
      redirect to root_path
    else
      render :new
    end
  end

  def edit
  end
  
  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  
  def destroy
    @item.destroy
    redirect_to root_path
  end  

  private
  def item_params
    params.require(:item).permit(:title, :text, :category_id, :brand_id, :status, :delivery_charge_id, :delivery_origin, :delivery_size, :delivery_method_id, :delivery_days, :price, images_attributes: [:image, :_destroy, :id]).merge(seller_id: current_user.id)
  end
  
  def set_item
    @item = Item.find(params[:id])
  end


end
