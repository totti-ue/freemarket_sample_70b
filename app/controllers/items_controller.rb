class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create, :search]
  before_action :set_card, only: [:purchase, :pay]

  def index
    @items = Item.includes(:images).order('created_at DESC').limit(3)
    @items_old = Item.includes(:images).order('created_at ASC').limit(3)
  end

  def new
    @item = Item.new
    @item.images.new
    @parents = Category.roots
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @category_id = @item.category_id
    @grandchild = Category.find(@category_id)
    @child = @grandchild.parent
    @parent = @child.parent
  end

  def edit
    @parents = Category.roots
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

  def search
    @items = Item.includes(:images).search(params[:keyword])
    
  end
  
  require 'payjp'

  # 購入確認画面用
  def purchase
    if @card.blank?
      redirect_to new_user_card_path(current_user.id)
    else
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
      @address = Address.where(user_id: current_user.id)[0]
  end

  # 購入確定用
  def pay
    Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
    Payjp::Charge.create(
    amount: @item.price,
    customer: @card.customer_id,
    currency: 'jpy',
    )
    @item.update( buyer_id: current_user.id )
    redirect_to done_item_path(@item.id)
  end

  private
  def item_params
    params.require(:item).permit(:title, :text, :category_id, :brand, :status, :delivery_charge_id, :delivery_origin_id, :delivery_size, :delivery_method_id, :delivery_days, :price, images_attributes: [:image, :_destroy, :id]).merge(seller_id: current_user.id)
  end
  
  def set_item
    @item = Item.find(params[:id])
  end

  def set_card
    @card = Card.where(user_id: current_user.id).first
  end
  

end
