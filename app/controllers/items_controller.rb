class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :editable_item!, only: [:edit, :update]

  def index
    @items = Item.order('created_at DESC')
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
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :name, :text, :price, :category_id, :condition_id,
      :postage_payer_id, :prefecture_id, :preparation_days_id,
      :image
    ).merge(user_id: current_user.id)
  end

  def editable_item!
    @item = Item.find(params[:id])
    redirect_to root_path unless current_user == @item.user # && @item.contract = nil
  end
end
