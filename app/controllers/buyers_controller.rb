class BuyersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @buyer_address = BuyerAddress.new
  end

  def create
    binding.pry
    @buyer_address =BuyerAddress.new(buyer_params)
    if @buyer_address.valid?
      @buyer_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def buyer_params
    params.require(buyer_address).permit(:yubin_number, :prefecture_id, :municipality, :address, :building, :phone_number).merge(user_id: current_user.id)
  end

  def item_params
    params.require(:item).permit(:name, :explanation, :image, :price, :category_id,:delivery_price_id, :situation_id, :prefecture_id, :shipping_day_id).merge(user_id: current_user.id)
  end


end
