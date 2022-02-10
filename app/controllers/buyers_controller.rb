class BuyersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @buyer_address = BuyerAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
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
    params.require(:buyer_address).permit(:yubin_number, :prefecture_id, :municipality, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
