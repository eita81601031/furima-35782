class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]
  before_action :order_confirmation, only: [:index]

  def index
    if current_user.id == @item.user.id
      redirect_to root_path and return
    end
    @order_arrivals = OrderArrivals.new
  end

  def new
    @order_arrivals = OrderArrivals.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_arrivals = OrderArrivals.new(order_params)
    if @order_arrivals.valid?
      pay_item
      @order_arrivals.save
       redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_arrivals).permit(:post_code, :prefecture_id, :city, :address, :building, :phone).merge(token: params[:token],item_id: params[:item_id],user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_confirmation
    if user_signed_in? && @item.order.present?
      redirect_to root_path and return
    end
  end

end