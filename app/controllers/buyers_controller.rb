class BuyersController < ApplicationController

  def index
    @buyer_address = BuyerAddress.new
  end

  def create
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

end
