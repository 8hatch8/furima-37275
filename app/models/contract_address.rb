class ContractAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :municipality, :address, :building, :tel

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)'}
    validates :municipality
    validates :address
    validates :tel, format: {with: /\A[0-9]{10,11}\z/, message: 'is invalid.'}
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    contract = Contract.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building: building, tel: tel, contract_id: contract.id)
  end

end