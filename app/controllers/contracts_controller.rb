class ContractsController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    # @contract_address = Contract_address.new 
  end

end
