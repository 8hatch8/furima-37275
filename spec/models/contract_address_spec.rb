require 'rails_helper'

RSpec.describe ContractAddress, type: :model do
  before do
    @contract_address = FactoryBot.build(:contract_address) 
  end

  describe "商品購入機能" do
    context "購入できる場合" do
      it "postal_code, prefecture_id, municipality, address, building,
       :tel, :item_id, user_id, tokenがあれば購入できる" do
        expect(@contract_address).to be_valid
      end
      it "building がなくても購入できる" do
        @contract_address.building = nil
        expect(@contract_address).to be_valid
      end
      it "tel が10桁でも購入できる" do
        @contract_address.tel = 1234567890
        expect(@contract_address).to be_valid
      end
    end

    context "購入できない場合" do
      it 'postal_code がなければ購入できない' do
        @contract_address.postal_code = nil
        @contract_address.valid?
        expect(@contract_address.errors.full_messages).to include "Postal code can't be blank"
      end
      it 'postal_code が全角数字では購入できない' do
        @contract_address.postal_code = "１２３-４５６７"
        @contract_address.valid?
        expect(@contract_address.errors.full_messages).to include "Postal code is invalid. Include hyphen(-)"
      end
      it 'postal_code にハイフンがなければ購入できない' do
        @contract_address.postal_code = "1234567"
        @contract_address.valid?
        expect(@contract_address.errors.full_messages).to include "Postal code is invalid. Include hyphen(-)"
      end

      it 'prefecture_id がなければ購入できない' do
        @contract_address.prefecture_id = nil
        @contract_address.valid?
        expect(@contract_address.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'municipality がなければ購入できない' do
        @contract_address.municipality = nil
        @contract_address.valid?
        expect(@contract_address.errors.full_messages).to include "Municipality can't be blank"
      end
      it 'address がなければ購入できない' do
        @contract_address.address = nil
        @contract_address.valid?
        expect(@contract_address.errors.full_messages).to include "Address can't be blank"
      end

      it 'tel がなければ購入できない' do
        @contract_address.tel = nil
        @contract_address.valid?
        expect(@contract_address.errors.full_messages).to include "Tel can't be blank"
      end
      it 'tel が10桁未満なら購入できない' do
        @contract_address.tel = "123456789"
        @contract_address.valid?
        expect(@contract_address.errors.full_messages).to include "Tel is invalid."
      end
      it 'tel が12桁以上なら購入できない' do
        @contract_address.tel = "123456789012"
        @contract_address.valid?
        expect(@contract_address.errors.full_messages).to include "Tel is invalid."
      end
      it 'tel に数字以外の文字があれば購入できない' do
        @contract_address.tel = "a234567890"
        @contract_address.valid?
        expect(@contract_address.errors.full_messages).to include "Tel is invalid."
      end
      it 'tel は全角数字では購入できない' do
        @contract_address.tel = "１２３４５６７８９０"
        @contract_address.valid?
        expect(@contract_address.errors.full_messages).to include "Tel is invalid."
      end

      it 'token がなければ購入できない' do
        @contract_address.token = nil
        @contract_address.valid?
        expect(@contract_address.errors.full_messages).to include "Token can't be blank"
      end
      it 'item_id がなければ購入できない' do
        @contract_address.item_id = nil
        @contract_address.valid?
        expect(@contract_address.errors.full_messages).to include "Item can't be blank"
      end
      it 'user_id がなければ購入できない' do
        @contract_address.user_id = nil
        @contract_address.valid?
        expect(@contract_address.errors.full_messages).to include "User can't be blank"
      end
    end
  end
end
