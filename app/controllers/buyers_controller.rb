class BuyersController < ApplicationController
  before_action :authenticate_user!, only:  :index
  before_action :set_item, only: [:index, :create]
  before_action :move_to_not_buy, only:  :index
  before_action :move_to_not_buy2, only:  :index


  def index
    @buyer_address = BuyerAddress.new
  end

  def create
    @buyer_address =BuyerAddress.new(buyer_params)
    if @buyer_address.valid?
      pay_item
      @buyer_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def buyer_params
    params.require(:buyer_address).permit(:yubin_number, :prefecture_id, :municipality, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price, 
      card: buyer_params[:token],    
      currency: 'jpy'                
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end


  def move_to_not_buy
    if @item.user.id == current_user.id
      redirect_to root_path
    end
  end

  def move_to_not_buy2
    if @item.buyer.present?
      redirect_to root_path
    end
  end

  

end
