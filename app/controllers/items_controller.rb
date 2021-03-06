class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, except: [:index, :new, :create]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  before_action :order_confirmation, only: [:edit]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
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
  end

  def edit
    #redirect_to root_path unless current_user.id == @item.user_id
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to item_path
   else
     render :edit
   end
  end

   def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :root_path
    end
   end

  private

  def item_params
    params.require(:item).permit(:product_name, :description, :price, :status_id, :shipping_cost_id, :prefecture_id, :shipping_id, :category_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to root_path unless current_user == @item.user
  end

  def order_confirmation
    if user_signed_in? && @item.order.present?
      redirect_to root_path and return
    end
    if current_user == @item.user && @item.order.present?
      redirect_to root_path and return
    end
  end

  
end
