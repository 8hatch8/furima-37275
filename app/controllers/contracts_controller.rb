class ContractsController < ApplicationController

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

end
