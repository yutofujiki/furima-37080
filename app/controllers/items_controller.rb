class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  before_action :move_to_edit, only: [:edit, :destroy]

  before_action :move_to_not_buy2, only:  [:edit, :destroy]

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
    @comments = @item.comments.includes(:user)
    @comment = Comment.new
  end

  def edit
  end

  def destroy
    @item.destroy
    redirect_to root_path
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
    params.require(:item).permit(:name, :explanation, :price, :category_id,:delivery_price_id, :situation_id, :prefecture_id, :shipping_day_id, {images: []} ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_edit
    unless @item.user.id == current_user.id
      redirect_to root_path
    end
  end

  def move_to_not_buy2
    if @item.buyer.present?
      redirect_to root_path
    end
  end

end
