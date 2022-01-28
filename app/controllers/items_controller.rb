class ItemsController < ApplicationController

  def index
    @items =Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new (item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  private 
  def item_params
    params.require(:item).permit(:name,:explanation,:category_id,:delivery_price_id, :situation_id, :prefecture_id, :shipping_day_id).merge(user_id: current_user.id)
  end

end
