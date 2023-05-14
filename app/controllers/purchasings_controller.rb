class PurchasingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :prevent_url, only: [:index, :create]

  def index
    @purchasing_shipping_address = PurchasingShippingAddress.new
    if @item.user_id == current_user.id
       redirect_to root_path
    end
  end

  def create
    @purchasing_shipping_address = PurchasingShippingAddress.new(purchasing_params)
    if @purchasing_shipping_address.valid?
      pay_item
      @purchasing_shipping_address.save
      redirect_to root_path 
    else
      render :index
    end
  end

  private
  def purchasing_params
    params.require(:purchasing_shipping_address).permit(:purchasing_id, :post_code, :region_of_origin_id, :municipalities, :address, :building, :telephone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def prevent_url
    if @item.purchasing != nil 
       redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price, 
      card: purchasing_params[:token],    
      currency: 'jpy'                 
    )
  end
end
