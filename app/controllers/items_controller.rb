class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  
  before_action :set_item, only: [:show, :edit, :update ]

  before_action :move_to_edit, only: :edit

  def index
    @items =Item.all.order("created_at DESC")
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else 
      render :edit
    end
  end



  private 
  def item_params
    params.require(:item).permit(:name, :explanation, :image, :price, :category_id,:delivery_price_id, :situation_id, :prefecture_id, :shipping_day_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_edit
    unless @item.user.id == current_user.id
      redirect_to root_path
    end
  end

end
