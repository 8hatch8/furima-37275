class ContractsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :available_item!, only: [:new, :create]

  def new
    @item = Item.find(params[:item_id])
    @contract_address = ContractAddress.new 
  end

  def create
    @contract_address = ContractAddress.new(contract_params)
    if @contract_address.valid?
      @contract_address.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :new
    end
  end

  private

  def contract_params
    params.require(:contract_address).permit(:postal_code, :prefecture_id, :municipality, :address, :building, :tel, :user_id).merge(item_id: params[:item_id], user_id: current_user.id)
  end

  def available_item!
    @item = Item.find(params[:item_id])
    redirect_to root_path unless current_user != @item.user && @item.contract == nil
  end

end
